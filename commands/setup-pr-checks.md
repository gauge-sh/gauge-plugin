---
description: Set up Gauge PR checks for the current repository (requires the gauge CLI)
---

Set up Gauge PR checks for the repository in the current directory. This needs
a terminal with the `gauge` CLI, so it works in Claude Code and Cowork sessions
on the user's computer, not in Claude.ai chat. If the CLI is missing, follow
the install steps in the `gauge-agents` skill.

Follow the `gauge-agents` skill's `references/github-setup.md`: inspect the
repository, choose the input surface the user wants tested, author `gauge.json`
using the user's real Gauge workspace slug, reuse the existing CI, and run
`gauge run --verify -o json` before committing. Leave a reviewable change and
state clearly any step that still needs the user, such as installing the Gauge
GitHub App on the repository.

$ARGUMENTS
