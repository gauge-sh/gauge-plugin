---
name: gauge-chat
description: Improve how AI assistants such as ChatGPT, Perplexity, Gemini, Copilot, and Google AI Overviews describe and recommend your brand with Gauge Chat. Use for AI search visibility (GEO/AEO), share of voice, and competitor, citation, and sentiment research in AI answers; managing Gauge's tracked topics and prompts; Action Center recommendations; and creating or updating content to improve AI visibility. Works through the Gauge MCP or the `gauge chat` CLI. Not for LLM prompt management or coding-agent evals.
---

# Gauge Chat

Be the answer for AI. Help the user's brand earn accurate, relevant recommendations when buyers ask ChatGPT and other chat or search models about their market. Measure what models say about the brand and its competitors, learn which sources and messages are working, and improve the content behind those answers so models become a marketing channel for the business.

Use a continuous loop: measure answers, understand the market, act on the evidence, and measure again. Route coding-agent tool selection and implementation evals to Gauge Agents instead.

## Operate headlessly with Gauge MCP

Use the connected Gauge MCP tools for research and execution. Discover current tool descriptions and schemas before calling them; available integrations and operations depend on the connected account.

If Gauge is not connected, use [the MCP setup guide](https://docs.withgauge.com/help/mcp). The server URL is `https://app.withgauge.com/mcp`. OAuth is the default for interactive clients; unattended clients can use an organization API key through an `Authorization: Bearer` header supplied by their secret configuration. Setup details are in Gauge under Settings → Integrations → MCP. Installing this skill does not establish that connection.

Resolve the organization and category before querying. For agency connections, discover the client organizations and use the intended client's scope. Read available company context, competitor context, content strategy, and writing guidance through the memory tools. Do not assume the MCP client already has the context used by Gauge's in-app agent.

For questions about Gauge itself (features, plans, billing), read the documentation with `fetch_docs_page`, starting from its `llms.txt` index.

For bulk prompt changes, exports, or scripted reporting in a terminal, read [references/cli.md](references/cli.md).

## Measure what models say

Start with the user's audience, product, competitors, and buying questions. Inspect tracked topics and prompts to establish what the data represents. Distinguish category discovery prompts from branded questions about the company; both are useful, but answer different questions.

| Signal | Question it answers |
| --- | --- |
| Visibility / brand mentions | How often does the brand appear in the analyzed answers? |
| Citation rate | How often do answers cite a particular page or domain? |
| Sentiment and framing | What claims, strengths, limitations, or concerns do models associate with the brand? |
| Competitor answers and sources | Who appears instead, and what material supports those answers? |
| Search and referral data | What demand and site behavior can connected search or analytics tools corroborate? |

Use comparable dates, models, and prompt populations when assessing change. Prefer complete reporting days. Carry the selected prompt IDs into follow-up citation queries. Keep visibility and citations separate: a source can be cited without naming the brand. Neither metric alone establishes website traffic or market share.

Read the actual answers behind notable metrics. Identify the wording to improve and its supporting sources; avoid treating a sentiment label alone as an explanation. Preserve returned units: citation-tool percentages such as `0.46` mean 0.46%, and percentage-point changes differ from relative percentage changes.

## Learn what is working in the market

Inspect the competitors, cited pages, and search fanouts associated with the relevant questions. Look for useful patterns in audience fit, evidence, product comparisons, explanations, and content coverage. Treat those patterns as hypotheses to test, not proof that a format caused better visibility.

Use connected keyword research, Search Console, analytics, or CMS tools when they help evaluate the opportunity. Keep measured demand separate from brainstormed ideas. A competitor's presence matters only when the topic fits the user's actual product and audience.

Before proposing a new page, check existing content and drafts with `check_content_coverage` when available, then inspect relevant matches. A citation inventory is not a complete website inventory: absence from it does not prove a page does not exist. Prefer updating an appropriate existing page when that resolves the gap.

## Improve the answers

Prioritize a concrete intervention supported by the research: clarify a misleading product claim, improve an existing page, answer an uncovered buying question, strengthen examples and first-party evidence, or identify an influential external source worth addressing.

For content work, carry the target audience, question, positioning, evidence, and intended outcome into the brief. Use the MCP's available research, outline, writing, and review tools to produce the requested deliverable. Check factual claims and preserve the user's voice. Use Action Center when the user wants recommendations saved or managed there, and reuse relevant existing work.

Stay within the requested destination and stage. Analysis does not imply account edits, and drafting does not imply publication. When creation or editing is requested, proceed through the authorized work without asking again. Inspect returned state after writes; saved article edits can take effect immediately. Publish only within the user's authorization, and report the actual draft, staging, or live state.

After publication, compare the relevant answers and citations over a comparable period. Report what changed, which prompts and sources support it, and what remains uncertain. Improvements to content create a testable opportunity; they do not guarantee a recommendation or establish causation from a before/after comparison alone.

Return a concise finding, the supporting answer or source links, the action taken or recommended, and how its effect will be measured.

## Documentation

- [Gauge Chat](https://www.withgauge.com/)
- [Prompt tracking](https://www.withgauge.com/features/prompt-tracking/)
- [Sentiment analysis](https://www.withgauge.com/features/sentiment-analysis/)
- [Action Center](https://www.withgauge.com/features/action-center/)
- [Content engine](https://www.withgauge.com/features/content-engine/)
- [Gauge MCP capabilities and setup](https://docs.withgauge.com/help/mcp)
