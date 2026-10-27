# Gauge plugin for Claude

Gauge shows how your product shows up where people and agents now look for
answers:

- **Gauge Chat** measures how often AI assistants (ChatGPT, Perplexity, Gemini,
  Google AI Overviews, Copilot) mention and cite your brand, which competitors
  they recommend instead, and which pages they rely on. Gauge then recommends
  work in the Action Center and can write and publish the content.
- **Gauge Agents** measures how well coding agents discover and use your
  product: whether they succeed at real tasks with your docs, CLI, npm package,
  or skill, where they struggle, and which tools they choose.

This plugin teaches Claude how to work with both, so you can read results, act
on them, and set up checks without learning every tool and command.

## What is included

- **Gauge connector** (`.mcp.json`): Gauge's remote MCP server, shared by Chat
  and Agents.
- **`gauge-chat` skill:** AI search visibility, competitor and citation
  research, tracked topics and prompts, the Action Center, and content
  creation, through the connector or `gauge chat` in a terminal.
- **`gauge-agents` skill:** Gauge Agents evals, agent preference, and PR checks
  through the `gauge` CLI, and reading or launching hosted results through the
  connector.
- **Commands:**
  - `/gauge:visibility-report` summarizes your AI search visibility and what
    drives it.
  - `/gauge:next-actions` shows what to work on next from the Action Center.
  - `/gauge:agents-results` summarizes recent Agents runs and the friction
    agents hit.
  - `/gauge:setup-pr-checks` sets up Gauge PR checks for the current
    repository.

## Install

- **Claude.ai and Cowork:** go to **Customize > Plugins > Add > Add
  marketplace**, enter `gauge-sh/gauge-plugin`, and install Gauge. Then open
  the plugin's **Connectors** tab, connect the Gauge connector, and sign in
  with your Gauge account. On Team and Enterprise plans, an owner may need to
  allow user-added plugins and add the connector for the organization first.
- **Claude Code:** install from this repository:

  ```text
  /plugin install gauge --marketplace gauge-sh/gauge-plugin
  ```

  The Gauge server starts with the plugin. If `/mcp` shows it as needing
  authentication, select it and sign in with your Gauge account. To try a
  local checkout instead, start Claude Code with
  `claude --plugin-dir ./gauge-plugin`.

## Requirements

- A Gauge account for the connector. Local Gauge Agents runs through the CLI
  need no account.
- For the CLI workflows (`gauge-agents` skill, `gauge chat`, and
  `/gauge:setup-pr-checks`): a terminal with Node.js 22.13 or later, which means
  Claude Code or a Cowork session on your computer. The plugin does not bundle
  the CLI; Claude installs it with `npm install -g @withgauge/cli` when needed.
  Claude.ai chat has no shell, so use the connector there.
- Local Agents runs also need Docker and credentials for the coding agents you
  test.

## Data and permissions

- The connector sends your questions and tool arguments to Gauge at
  `app.withgauge.com` and returns results from your Gauge organizations. Access
  is limited to the organizations you sign in to and authorize.
- Some connector actions change things: adding tracked prompts (which count
  against your plan), creating Action Center items, launching Agents evals
  (which can spend credits), and publishing articles to your connected CMS.
  Claude is instructed to ask before these, and to publish to your live site
  only when you explicitly ask.
- The CLI runs on your machine. In local mode, Agents evals run on your machine
  with Docker and do not require a Gauge account. In hosted mode and for
  `gauge chat`, the CLI contacts Gauge and may upload the inputs you select (for
  example a packed package or docs files). The CLI also has an optional
  anonymous usage telemetry setting, which you can manage with
  `gauge telemetry`.
- The plugin itself stores nothing and contains no credentials.

## Development

The `gauge-agents` and `gauge-chat` skills are maintained in
[gauge-sh/gauge-skills](https://github.com/gauge-sh/gauge-skills), where changes
are measured with Gauge Agents before release. This repository holds copies
pinned in `skills.lock`. Edit those skills upstream, then update the copies:

```sh
scripts/sync-skills.sh --ref <commit>
```

CI runs `scripts/sync-skills.sh --check` to keep the copies identical to the
pinned commit.

## Learn more

Documentation: https://docs.withgauge.com
