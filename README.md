# Inkie Claude plugin

Inkie exposes a Model Context Protocol (MCP) server so AI agents can create and schedule content directly. This plugin pairs that server with a marketing skill for small businesses: draft captions, read brand information, review content plans, generate social posts and blogs, schedule content, and attach uploaded media.

The endpoint is `https://app.inkie.ink/api/mcp`, a Streamable HTTP MCP endpoint. Tool discovery is at `https://app.inkie.ink/.well-known/mcp/manifest`. See the [public Inkie MCP docs](https://app.inkie.ink/docs/mcp).

## Set up this plugin

1. In Inkie, get an API key from **Settings → API keys** for the client you intend to use.
2. Set `INKIE_MCP_API_KEY` in the environment of the process launching Claude. Do not put it in this repository, a prompt or a report. For Bash, enter it without echoing:

   ```bash
   read -r -s -p 'Inkie API key: ' INKIE_MCP_API_KEY
   printf '\n'
   export INKIE_MCP_API_KEY
   ```

3. From this plugin directory, load it locally:

   ```bash
   claude --plugin-dir .
   ```

4. Ask naturally, for example: "Read my brand information and draft an Instagram caption about our new workshop. Do not schedule it yet." For scheduling, include the channel, date and local time. The key determines the client; naming another business does not switch clients.

The bundled `.mcp.json` reads `${INKIE_MCP_API_KEY}` into the Bearer header. No key is bundled. Do not also add the same server globally when testing this plugin.

## Other clients and OAuth

The public docs describe OAuth 2.1 as the normal connection flow: modern clients open a browser for Inkie sign-in on first use and remember the token. For Claude Desktop, add the following to `claude_desktop_config.json`, restart Desktop, then sign in on first use:

```json
{ "mcpServers": { "inkie": { "url": "https://app.inkie.ink/api/mcp" } } }
```

The public Claude Code setup is:

```bash
claude mcp add inkie \
  --transport http \
  --url https://app.inkie.ink/api/mcp
```

In Cursor, add an MCP server named `inkie`, transport HTTP, URL `https://app.inkie.ink/api/mcp`; no manual header is needed for OAuth. API keys are the documented fallback, and this plugin deliberately uses that environment-based fallback.

## Media and evals

The skill also covers `attach_image_asset`, which is absent from the public tool table. Direct image upload uses an authenticated app session to request a signed URL, a raw PUT to storage, then MCP attachment. An MCP API key alone is insufficient for the upload URL endpoint. Existing uploaded images can be attached through MCP. Videos require upload and readiness polling before attachment.

See [EVALS.md](EVALS.md) for the 12-case mocked suite, baseline comparison and separate live test-account run. Behavioural evals call models even when all server tools are mocked.

## Directory submission

Nothing is published by loading or validating this folder. When ready, submit the remote server as an **MCP connector**, then this folder as a **plugin bundle**, from the intended owning organisation at [the developer portal](https://claude.ai/directory/manage). The bundle's repository must be public before listing. Use the same MCP URL and organisation so the listings can be paired. Anthropic validates and scans each bundle version and reviews new listings. See [publishing guidance](https://claude.ai/docs/directory).
