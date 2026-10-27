# Test candidate docs at their canonical URL

Use a `web-fixture` input when an agent should visit the original HTTPS URL and
receive candidate content. This works locally or hosted in CLI 0.25.0. It differs
from a `files` input (handed-in content) and a `website` input (hosted resolution
of a GitHub deployment or PR-comment preview).

Read `gauge instructions run --local` for current limits and launch guidance.
For one replacement page, write a fixture JSON file such as `fixtures/docs.json`:

```json
{
  "version": 1,
  "pages": [
    {
      "url": "https://example.com/hello",
      "status": 200,
      "contentType": "text/html",
      "body": "<h1>Hello CLI</h1><p>Run hello Ada to print Hello Ada.</p>"
    }
  ]
}
```

Replace the URL and body with the user's candidate. `pages` is an array of exact
URL replacements, not a URL-keyed object. The body is the content itself, not a
filename. Original hostnames must resolve. Keep the fixture under 1 MB; overlapping
routes, search mocks, and body transformations are unsupported.

Merge this input into the existing `gauge.json`, preserving other keys:

```json
{
  "version": 2,
  "inputs": {
    "docs": { "type": "web-fixture", "path": "fixtures/docs.json" }
  }
}
```

Attach `docs` through a case's `config.inputs: [docs]`, or use
`gauge run --eval <id> --local --input docs` for a saved local eval. Ask the tested
agent to use the canonical URL; grade the requested behavior against the candidate
content. Do not substitute a different URL or a supplied file when canonical URL
replacement is the requested test.

For shared cases, `gauge run --verify --local -o json` checks static setup.
`gauge run --dry-run --local -o json` reports the selected fixture and runtime
readiness; saved evals can use `--eval <id> --input docs --dry-run --local`.
Neither runs an agent or proves delivery. Setup can finish with missing runtime
or credentials explicitly reported. Actual local execution needs Docker, the
runtime and gateway images (`gauge local runtime pull`), and agent credentials.
Keep a local-only task local; it does not need Gauge login or hosted uploads.
