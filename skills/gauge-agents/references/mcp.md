# Gauge Agents through the Gauge MCP

Use the connected Gauge MCP to read and act on hosted Gauge Agents results
without the CLI. Its tools for Gauge Agents are prefixed `agents_`. Discover
current tool descriptions and schemas before calling them; available
operations depend on the connected account.

If Gauge is not connected, use [the MCP setup guide](https://docs.withgauge.com/help/mcp).
The server URL is `https://app.withgauge.com/mcp`. Never ask the user to paste
an API key into the conversation.

## Find the evidence

1. Resolve the organization first. Agency connections can reach several client
   organizations; ask which one when the request does not establish it.
2. Start from the question and fetch only what answers it:
   - An overview starts from the organization summary.
   - Saved evals and preference prompts carry their configuration and
     statistics; read the definition before interpreting results.
   - "Why did this session fail?" starts from the session's insight, then the
     trace events it cites, then the diff when the outcome depends on what the
     agent changed.
   - Custom reports start from the query metadata. Do not guess dataset fields.
   - Before-and-after questions use the run comparison rather than two separate
     summaries.
3. Lists, traces, and diffs are paged. Follow the returned cursor or offset
   before claiming coverage. Say when an event was truncated or only previewed.

## Interpret it

- Execution success is not a criterion pass. A session can finish cleanly and
  fail its criteria.
- Missing or pending analysis is not a negative result, and an empty or
  unavailable trace does not prove the agent never encountered the product.
- Preference results are advisory: a competitor or "neither" selection is a
  measurement, not a failure.
- Report sample counts, models, and the runs a finding comes from. One session
  is an observation, not a pass rate. Keep freshness, analysis coverage, and
  comparison warnings in the answer.
- Cite trace events or diff lines when explaining why a criterion failed, and
  separate agent mistakes from environment, fixture, or judging failures. A
  judging failure is not a criterion failure.

## Act on it

- Launching a saved eval or preference starts paid sessions. Name what will run,
  with its agents, models, and samples, and wait for the user's go-ahead.
- Do not retry an uncertain launch. List recent runs first, since a retry can
  start duplicate sessions.
- Cancel only runs the user asked to stop.
- The MCP does not author or edit evals, inputs, or PR checks. Use the CLI for
  those.
