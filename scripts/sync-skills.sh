#!/usr/bin/env bash
# Copy the skills listed in skills.lock from gauge-sh/gauge-skills into skills/.
#
#   scripts/sync-skills.sh               copy the skills at the pinned commit
#   scripts/sync-skills.sh --ref <ref>   pin a new commit (branch, tag, or SHA), then copy
#   scripts/sync-skills.sh --check       exit 1 if skills/ differs from the pinned commit
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
lock="$root/skills.lock"

mode=sync
ref=""
while [ $# -gt 0 ]; do
  case "$1" in
    --check) mode=check ;;
    --ref) ref="${2:?--ref needs a value}"; shift ;;
    -h|--help) sed -n '2,6p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
  shift
done

lock_value() { sed -n "s/^$1=//p" "$lock"; }
repo="$(lock_value repo)"
commit="$(lock_value commit)"
read -r -a skills <<< "$(lock_value skills)"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
git -C "$tmp" init -q src

if [ -n "$ref" ]; then
  git -C "$tmp/src" fetch -q --depth 1 "$repo" "$ref"
  commit="$(git -C "$tmp/src" rev-parse FETCH_HEAD)"
  sed -i.bak "s/^commit=.*/commit=$commit/" "$lock" && rm -f "$lock.bak"
else
  git -C "$tmp/src" fetch -q --depth 1 "$repo" "$commit"
fi

mkdir "$tmp/out"
git -C "$tmp/src" archive "$commit" -- "${skills[@]}" | tar -x -C "$tmp/out"

status=0
for skill in "${skills[@]}"; do
  if [ "$mode" = check ]; then
    if ! diff -r "$tmp/out/$skill" "$root/skills/$skill" > /dev/null 2>&1; then
      echo "skills/$skill differs from gauge-skills@${commit:0:12}" >&2
      status=1
    fi
  else
    rm -rf "$root/skills/$skill"
    cp -R "$tmp/out/$skill" "$root/skills/$skill"
    echo "skills/$skill <- gauge-skills@${commit:0:12}"
  fi
done

if [ "$status" -ne 0 ]; then
  echo "Edit skills in gauge-sh/gauge-skills, then run scripts/sync-skills.sh." >&2
fi
exit "$status"
