# Gauge Chat from the CLI

`gauge chat` (CLI 0.25.0 or later) reads and manages Gauge Chat through the Chat
API. Prefer it over the MCP for bulk prompt changes, exports, and scripted
reports. If `gauge` is missing, install it with Node.js 22.13 or later:

```sh
npm install -g @withgauge/cli
```

Sign in with `gauge auth login`. For scripts and CI, set `GAUGE_API_TOKEN` to an
organization API key created in Settings → API Keys; never put the key in a
prompt or commit it. Commands use the selected organization (`gauge orgs`), and
category-scoped commands take `--category`. `gauge chat categories use
<category>` saves a default.

| Task | Command |
| --- | --- |
| Categories, topics, tags, brands | `gauge chat categories`, `topics`, `tags`, `brands` |
| Add, move, tag, or untag prompts | `gauge chat prompts add`, `move`, `tag`, `untag` |
| Reports | `gauge chat query`; discover fields with `query datasets`, `fields`, `metadata` |
| Answers and citations | `gauge chat answers list`, `answers get`, `citations list` |

- Preview prompt writes with `gauge chat prompts add --dry-run` and show the
  user the result before writing. New prompts count against plan limits.
- Pass `-o json` and parse the result. List commands return `{data, nextCursor}`;
  `--all` follows cursors up to `--max`.
- Query rate metrics are 0–1 fractions.
- Errors carry the API code (for example `insufficient_scope`, `limit_exceeded`,
  `rate_limited`). Invalid requests exit 2 and plan limits exit 3.

Run `gauge chat <command> --help` for flags.
