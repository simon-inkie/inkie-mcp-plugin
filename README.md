# Inkie for Claude

Create and schedule small-business marketing content with Inkie.

[Inkie](https://inkie.ink) is a marketing platform for small businesses. It keeps your business information, audience, brand voice, content ideas and publishing schedule together, and helps you create social posts and blogs.

This Claude plugin connects to your Inkie account and adds a marketing skill. Ask Claude to read your brand information, draft captions, review your monthly content plan, save ideas, or create and schedule content on your connected channels.

## What you can do

- Draft captions in the conversation using your Inkie brand information.
- Review a monthly content plan and suggest gaps to fill.
- Save content ideas and update agreed business or brand information.
- Generate social posts and blogs, or schedule copy you have already written.
- Edit captions and blogs, move unpublished content to another date, and attach uploaded images or ready videos.

Drafting in the conversation does not save or schedule a post. Inkie's create and generate tools schedule real content. When you ask to schedule, give the channel, date and local time. Available channels depend on your Inkie account's connections; Claude checks them before scheduling. Scheduled content is not necessarily published yet.

## Install

You need Claude Code and your own Inkie account. Connect your publishing channels in Inkie if you want to schedule social posts or blogs.

Download this repository from [GitHub](https://github.com/simon-inkie/inkie-mcp-plugin), then open a terminal in its root directory. The commands below load the plugin locally; a directory listing is not required.

## Connect your Inkie account

The plugin signs in with OAuth. No API key or credential is bundled or needed.

1. Start Claude Code with the plugin: `claude --plugin-dir .`
2. Run `/mcp`, select the `inkie` server and choose to authenticate. Your browser opens Inkie's sign-in and consent page.
3. Sign in to Inkie and approve access. Claude stores the token and refreshes it for you.

The account you sign in with selects the Inkie business. Naming a different business in a prompt does not switch accounts. Start with a read request to check the business information before scheduling anything. Avoid adding a second copy of the same server globally while using this plugin.

### Other ways to connect

You can connect the server without this plugin's marketing skill. In Claude Code:

```bash
claude mcp add --transport http inkie https://app.inkie.ink/api/mcp
```

In Claude Desktop or Claude on the web, add a custom connector with the URL below in your account's connector settings and sign in with OAuth. Do not paste the URL into `claude_desktop_config.json`. Servers added without the plugin supply tools only.

The server uses Streamable HTTP at:

```text
https://app.inkie.ink/api/mcp
```

API keys (Settings → API keys in Inkie) are a fallback for clients that cannot complete a browser sign-in. They are not used by this plugin. See the [Inkie MCP documentation](https://app.inkie.ink/docs/mcp).

## Example requests

- “Read my business overview, audience and brand voice. Draft an Instagram caption for our new pottery workshop. Do not save or schedule it.”
- “Review next month's content plan. Suggest three gaps we could fill without changing the plan.”
- “Save this idea for next month: a short video showing how we prepare for a workshop.”
- “Check my enabled channels. Schedule an Instagram post for 10 November 2099 at 09:00 in my Inkie timezone: ‘Our winter pottery workshops are open for bookings. Bring a friend and make something together.’ Use that copy for both captions and this image: https://example.com/pottery.jpg.”
- “Generate and schedule a blog about caring for handmade ceramics for 12 November 2099 at 10:00 in my Inkie timezone. Check the available blog channel first.”
- “Find the unpublished workshop post in my November 2099 plan and move it to 14 November at 09:00. Confirm which item you are moving first.”

Replace the sample business details and dates with your own. Create and generate requests can lead to publication through Inkie at the scheduled time.

## Media and limits

You can attach an existing Inkie image asset or a video that has finished processing, or use a publicly hosted image. Scheduling a social post needs an image: give a public image URL, or ask Inkie to generate the post. Claude's tools cannot upload files. Direct upload of a local file uses separate Inkie HTTP endpoints that accept a signed-in app session or an Inkie API key as a Bearer token, and Claude needs HTTP or shell access to call them. If that is not available, upload the file in Inkie first.

The plugin cannot connect new publishing channels, switch businesses by name, or automatically create a whole monthly content plan. Permanent deletion requires explicit authorisation for the specific item; Inkie refuses to delete items it knows are published, but Claude checks the item's state first rather than relying on that.

## Documentation and testing

See the [MCP documentation](https://app.inkie.ink/docs/mcp) for the server, [EVALS.md](EVALS.md) for the mocked evaluation suite and dedicated test-account procedure, and [SUBMISSION.md](SUBMISSION.md) for directory listing and reviewer materials. The suite is supplied without a claim that behavioural or live tests have passed.

## Licence

This plugin is licensed under [Apache-2.0](LICENSE).
