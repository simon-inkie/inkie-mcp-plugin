# Inkie directory submission pack

Prepared for the plugin at the repository root. Copy the listing text below into the matching fields. **NEEDED** marks information that is not established by the supplied documents or repository. Keep reviewer credentials in the portal's private fields, never in this file.

## Submission identity and source

| Field | Value |
| --- | --- |
| Listing name | Inkie |
| Plugin identifier | `inkie` |
| Version | `0.1.0` |
| Publisher / company display name | Inkie |
| Company website | https://inkie.ink |
| Repository | https://github.com/simon-inkie/inkie-mcp-plugin |
| Plugin path | Repository root; leave the optional path field empty |
| Manifest | `.claude-plugin/plugin.json` |
| Tracked branch or tag | Leave empty to follow the repository's default branch, unless Simon chooses a release tag |
| Licence | Apache-2.0; included in `LICENSE` |
| Documentation URL | https://app.inkie.ink/docs/mcp |
| MCP server URL | https://app.inkie.ink/api/mcp |
| Transport | Streamable HTTP |
| Authentication | OAuth 2.1 with browser sign-in; no bundled credential, no `userConfig` entries |
| Tool discovery | `tools/list` on the MCP endpoint; https://app.inkie.ink/.well-known/mcp/manifest is supplementary metadata |
| Suggested connector listing slug | `inkie`; confirm availability before publishing |
| Primary review contact | **NEEDED:** named contact and monitored email address |
| Public support contact | **NEEDED:** monitored email address or support URL |
| Privacy policy URL | **NEEDED:** confirmed public policy URL. The supplied docs do not reference a privacy policy |

Submit the remote server as an **MCP connector**, then the repository as a **plugin bundle**, using the same owning organisation and server URL so the listings can be paired. Use [the developer portal](https://claude.ai/directory/manage). The supplied publishing research describes these as separate submissions. This document does not submit or publish either.

## Listing copy

### One-line tagline

Create and schedule small-business marketing content with Inkie.

### Short description

Use your Inkie brand information to draft captions, review content plans, save ideas, and create or schedule social posts and blogs from Claude.

### Long description / connector detail card

Inkie is a marketing platform for small businesses. It brings together your business information, audience, brand voice, content ideas and publishing schedule.

Connect your Inkie account to Claude to read your brand information, draft captions, review a monthly content plan and save ideas. When you want to create content, Claude can send your finished copy to Inkie or ask Inkie to generate social posts and blogs. It can also edit existing content, move unpublished items to another date, and attach uploaded images or ready videos.

Draft requests stay in the conversation. Create and generate requests schedule real content in Inkie, so include the channel, date and local time. Available channels depend on the publishing connections enabled in your account. Claude checks those connections before scheduling and reports whether generation is still processing or the item is scheduled.

You bring your own Inkie account. The plugin signs in with OAuth in your browser, and no API key or credential is bundled. Inkie's MCP tools do not carry file bytes. Inkie's separate image and video upload endpoints accept that OAuth access token. Claude can upload a local file only with separate file and HTTP access and a securely available credential; otherwise upload it in Inkie first. Creating a social post from supplied copy requires a public image URL or 2 to 10 public carousel image URLs.

### Categories and audience

Suggested primary category: **Marketing**. Suggested additional categories, where the portal offers equivalents: **Content creation**, **Social media**, **Productivity**. These are proposed labels, not verified portal options; select the nearest available categories.

Audience: small-business owners and people managing their marketing. Prerequisites: an Inkie account, access to the intended business, and connected publishing channels for scheduling. Access mode: reads and writes.

### Example prompts

1. “Read my business overview, audience and brand voice. Draft an Instagram caption for our new pottery workshop. Do not save or schedule it.”
2. “Review next month's content plan and suggest three gaps we could fill. Do not change any content.”
3. “Save this content idea for next month: a behind-the-scenes video of preparing the studio for a workshop.”
4. “Check my enabled channels. Schedule an Instagram post for 10 November 2099 at 09:00 in my Inkie timezone: ‘Our winter pottery workshops are open for bookings. Bring a friend and make something together.’ Use this copy for both captions and this image: https://example.com/pottery.jpg.”
5. “Generate and schedule an Instagram post about caring for handmade ceramics for 11 November 2099 at 09:00 in my Inkie timezone. Read my brand information first, then show me the result when generation finishes.”
6. “Check my available blog channel. Generate and schedule a blog about choosing your first pottery workshop for 12 November 2099 at 10:00 in my Inkie timezone. Show me the title and content when it is ready.”
7. “Find the unpublished workshop post in my November 2099 plan. Confirm the item, then move it to 14 November at 09:00 in my Inkie timezone.”
8. “Find the workshop post we just scheduled. Replace its caption with ‘Make something with your hands this winter. Our pottery workshops are open for bookings.’ Keep its channels and scheduled time.”

The far-future dates are suitable for demonstrations. Normal users should supply their actual dates. These prompts assume the account supports the requested channel; Claude should explain an unavailable channel rather than substitute silently.

## What the plugin does

The bundle contains one marketing skill and one remote MCP server reference. It has no bundled application server, commands, agents or hooks.

| Capability | Behaviour |
| --- | --- |
| Brand context | Reads business, audience and voice documents; can save agreed updates while preserving existing facts |
| Drafting | Writes captions in the conversation without creating scheduled items |
| Planning | Reads monthly plans and ideas, suggests gaps, and saves individual ideas |
| Social content | Creates scheduled posts from supplied copy and a public image URL or 2 to 10 carousel image URLs, or starts AI generation; checks enabled platforms first |
| Blog content | Creates scheduled blogs from supplied Markdown or generates them from a topic; supports edits |
| Progress | Polls generation status, retrieves completed content, and distinguishes scheduled from published |
| Changes | Reads an item before editing or rescheduling; uses returned identifiers |
| Media | Attaches uploaded image assets and ready video assets; supports replacing images from public URLs |
| Deletion | Can permanently delete eligible unpublished content after explicit authorisation for the specific item |

The skill covers `attach_image_asset` and the separate HTTP image/video upload flow. The app branch documents both and authorises those HTTP routes with OAuth access tokens. Confirm that version is deployed and verify the upload flow before review; repository checks do not establish deployment or live success.

## What it does not do

- It does not offer a draft-only option on create or generate tools. Those tools schedule real content.
- It does not create a complete monthly plan automatically; there is no create-plan tool.
- It does not connect new social or blog publishing accounts. Users configure those in Inkie.
- It does not switch businesses when a prompt names another one. Authentication determines the client.
- Inkie's MCP tools do not carry file bytes. Direct image/video upload uses separate HTTP endpoints accepting an Inkie OAuth access token, an active Inkie API key as a Bearer token, or an app session. Claude.ai and Desktop's remote connector alone does not supply file upload or shell access. Claude Code can make the calls with file access, permitted HTTP/shell access and a securely available credential; connector sign-in does not automatically expose its token to the shell. Otherwise the user uploads in Inkie.
- It does not create a text-only social post: Inkie requires an image URL or carousel for `create_social_post`.
- It does not attach videos before processing is complete, or treat a local file path as a public image URL.
- It does not guarantee that generation has completed or content has published. Tool status determines the report.
- It does not delete published content or unpublish content to bypass a refusal. Inkie's own guard only checks for published social-post records, so Claude reads the item's state first.

## Authentication and reviewer access

Users bring their own Inkie account. The bundle's `.mcp.json` is the plain remote URL with no `Authorization` header and no environment placeholder, so Claude runs OAuth discovery itself and the user signs in through Inkie's browser consent page. No credential is bundled, and the bundle has no `userConfig` entries because it asks for none. [Inkie's MCP documentation](https://app.inkie.ink/docs/mcp) also describes API keys as a fallback for clients without browser sign-in; the bundle does not use them. A test-client key is used only by the eval wrapper `scripts/eval-live.sh`, in a private temporary copy.

The sign-in resolves to the account's primary Inkie business. The app branch sets protected-resource metadata `resource` to `https://app.inkie.ink/api/mcp`, and advertises the app origin as the authorisation server with `/authorize`, `/token` and `/register` proxy endpoints. It advertises `openid`, `email`, `profile` and `claudeai` scopes. **NEEDED:** confirm deployment, the registration mode accepted for Claude's directory client, actual consent scopes and end-to-end discovery/sign-in in Claude.ai, Desktop and Code.

**Reviewer account provision:** Simon must create or invite a reviewer to a dedicated, fully populated Inkie account and provide sign-in details and any verification steps through the portal's private test-account fields. No test account is included in the repository. Give the reviewer an Inkie login for this client so they can complete OAuth; there is nothing else to configure. For direct-upload checks, use a securely available test-client OAuth access token, app session or active test-client API key for the separate HTTP calls. Do not assume Claude exposes its managed connector token for those calls; arrange a private credential path if needed. An API key is not a substitute for testing OAuth.

Use the fictional client **Inkie Plugin Eval Test Client**, timezone **Europe/London**, with fictional business, audience and voice documents, a November 2099 plan, and test Instagram and WordPress destinations. Provide a scheduled unpublished social item, an unpublished blog with a promo, an uploaded image, a processed video and disposable items for deletion. Share their actual returned identifiers privately. Verify the sign-in resolves to this client; naming it in a prompt does not select it.

## Data handling and privacy

### Suggested plain-language summary

The plugin lets Claude read marketing information from the connected Inkie account and send requested changes back to Inkie. This can include business and brand documents, content ideas, captions, blog text, schedules and media references. These records may contain personal data if users put it in their content or documents. Tool results become available in the Claude conversation.

The bundled connection sends OAuth-authenticated tool requests to Inkie's HTTPS MCP endpoint. Creating, generating, editing or scheduling content saves records or starts jobs in Inkie. At the scheduled time, Inkie can publish content through the account's connected channels. Media workflows can retrieve public image URLs or transfer bytes to the storage URL returned by Inkie. Direct upload uses separate HTTP calls authorised by an Inkie OAuth access token, an active Inkie API key as a Bearer token, or a signed-in app session.

The bundle contains instructions and configuration, with no separate plugin database or bundled telemetry service. This does not establish how Inkie's hosted service, its generation providers, media storage, or Claude retain and process data. Those details must be confirmed in the relevant policies.

### Data handling answers to prepare

| Question | Draft answer / missing evidence |
| --- | --- |
| Reads personal data? | Potentially yes, when business documents or content contain personal data. Do not claim it cannot read personal data |
| Stores personal data? | Writes user-requested records to Inkie; the bundle has no separate datastore. **NEEDED:** hosted storage and retention details |
| Sends data outside declared connectors? | Normal MCP calls go to Inkie. Media can use public URLs and signed storage endpoints; Inkie publishes to connected destinations. **NEEDED:** storage domains, generation providers, subprocessors and what data each receives |
| Retention and deletion | **NEEDED:** retention periods for content, uploaded assets, API/OAuth records and server logs; account/data deletion procedure. Content deletion tools do not establish a full privacy deletion policy |
| Under-18 audience | Written for business marketing. **NEEDED:** confirm the service's intended age group and policy before answering the form |
| Underlying API | Inkie's own MCP endpoint and API, with configured publishing integrations. **NEEDED:** confirm first-party ownership and any partner permissions for the declaration |
| Health data | No health-specific workflow described. **NEEDED:** confirm the handling policy; free-text content can contain sensitive information |
| Sponsored content | Can create user-requested marketing content. **NEEDED:** confirm any sponsored-content disclosure or restrictions relevant to the form |
| Conversation collection | Tool arguments and responses pass between Claude and Inkie. **NEEDED:** confirm hosted logging and whether any wider conversation data is collected |
| Privacy policy | **NEEDED:** approved public URL covering collection, use, storage, sharing, retention and contact details |

Never paste credentials, signed upload URLs or real customer data into public listing copy, screenshots or eval reports. The skill instructs Claude to treat retrieved documents as data, preserve the user's instructions, and avoid exposing tokens. Eval reports may contain tool output and should stay private.

## Icons and screenshots

**NEEDED:** an approved Inkie listing icon. No icon or screenshot asset is included here. Supply a square brand icon with a transparent background if appropriate, and export it to the format and dimensions the portal requests; do not assume an undocumented icon size.

This bundle provides tools and a skill, with no interactive MCP App UI declared. The special MCP App carousel requirements therefore do not describe the current bundle. If the portal requests demonstration images, useful captures would be:

| Capture | Paired prompt | Show |
| --- | --- | --- |
| Brand-based draft | Example 1 | Caption and brand context, without scheduling |
| Plan review | Example 2 | Practical gaps in the fictional client's plan |
| Scheduled social post | Example 4 | Platforms, local time and returned item link or identifier |
| Generated blog | Example 6 | Completed blog title/content and schedule |

Use fictional data and remove account details and credentials. If an interactive MCP App is added, prepare 3 to 5 PNG captures at least 1,000 pixels wide, cropped to its response, with prompts supplied separately. See [connector submission requirements](https://claude.com/docs/connectors/building/submission) for current asset and listing limits.

## Reviewer test plan

### 1. Inspect and validate the bundle

Read the manifest, `.mcp.json` and marketing skill. Confirm the only configured MCP server is Inkie's HTTPS endpoint and that `.mcp.json` carries no header, token or environment placeholder. From the repository root:

```bash
claude plugin validate .
```

Record the version and commit under review. Static validation checks packaging; it does not prove authentication or tool behaviour. No behavioural or live pass is claimed in the supplied `EVALS.md`.

### 2. Run mocked behavioural coverage

Use Claude Code v2.1.269 or later and normal Claude authentication. No Inkie credential is required. From the root:

```bash
claude plugin eval . --mocks record --ablation with-without --no-publish --no-scaffold
```

Check all 18 cases, their outcome grades and the skill/tool-routing indicators. The baseline measures the whole bundle's contribution. For strict routing scores:

```bash
claude plugin eval . --mocks record --ablation none --no-publish --no-scaffold
```

Mock coverage includes brand reads, draft-only behaviour, plan reads, scheduling (including the rejected text-only request), generation polling, blog creation, ideas, rescheduling, caption edits, image and video attachment, deletion, upload explanation, onboarding updates, an unrelated task and an injected instruction. Read each case's outcome grade and its routing indicators, and use the strict `--ablation none` run as the release gate for routing and safety. It does not prove live uploads or live server behaviour. Model calls still occur. Keep reports local.

### 3. Test OAuth and account boundaries

Connect the server as a custom connector in Claude and sign in using the private reviewer account. Confirm tools load and the returned brand information belongs to the test client. Record consent and registration behaviour. Then load the bundle with `claude --plugin-dir .`, authenticate through `/mcp`, and repeat the check. Confirm an unauthenticated client gets a 401 with a `WWW-Authenticate` header and sees no account content. Do not probe real customer accounts.

### 4. Run the supported live eval subset

This eval-only path needs a test-client API key, because non-interactive runs cannot complete a browser sign-in. Only after verifying the key's client and test publishing destinations, enter the key without echoing and run:

```bash
read -r -s -p 'Test-client Inkie API key: ' INKIE_MCP_API_KEY
printf '\n'
export INKIE_MCP_API_KEY
bash scripts/eval-live.sh --runs 1
```

The wrapper supplies the eval-specific environment variable needed by isolated runs. The six live cases read brand/plan data, schedule supplied social copy, generate social and blog content, and append an idea. They create real records and jobs in November 2099. Repeated runs create duplicates. No automatic cleanup occurs. Read [EVALS.md](EVALS.md) before running; never run the mock-only mutation cases against the real server's fake fixture identifiers.

### 5. Manually exercise the remaining live tools

Use returned identifiers and disposable fixtures, recording expected and actual results privately.

| Test | Expected result |
| --- | --- |
| Draft and review using examples 1 and 2 | Reads relevant context, produces useful text, makes no content writes |
| List platforms; request an unavailable one | Uses enabled channels and explains unavailable choices |
| Read onboarding prompt; agree a document update | Retains existing facts and saves only agreed changes; does not expose the internal prompt |
| Create blog from supplied Markdown; read it back | Stored title, body, captions, platform and local schedule match the request |
| Edit social caption and blog fields | Reads first, changes requested fields only; schedule/platforms remain unless requested |
| Move an unpublished item across months | Correct destination plan and local date/time; completed or published items are refused where documented |
| List ideas after saving one | Requested idea appears in the chosen month |
| Replace image using a public URL | Intended item and image target change; unrelated content remains |
| Attach an uploaded image to a blog promo | Uses actual asset and item IDs and `target: social`; intended media is replaced |
| Explain local image upload | Explains OAuth/API-key/session authentication, separate HTTP transfers and each Claude surface's access requirements; offers app upload when access is unavailable; invents no upload tool |
| Direct image upload with a securely available test-client OAuth access token | OAuth-authenticated POST returns a signed URL, raw PUT succeeds without a Bearer header, then attachment succeeds; no image polling. Record the Claude surface and credential path. Separately check an active test-client API key or app session if provided |
| Schedule a social post with no image | Asks for an image URL or offers generation; no text-only post is created |
| Upload a video using a securely available test-client OAuth access token, poll with `uploadId`, attach with `clientImageId`; try an unready one | OAuth authorises both POST and GET; raw PUT uses the returned upload URL. Ready asset attaches; unready asset is refused without claiming success |
| Delete disposable unpublished blog/item | Requires specific authorisation, removes the intended records; does not bypass published-item refusal |

If the server exposes a tool to alter a blog's published status, test it only on a disposable test destination after separate explicit authorisation. Schedule dates alone do not make that operation harmless.

### 6. Record results and clean up

Capture the Claude version, plugin version/commit, server tool inventory, authentication route, expected/actual outcomes and failures without secrets. Verify every exposed tool, including tools outside the live-tagged eval cases, before making the portal's all-tools-tested declaration. Remove disposable scheduled items and restore fixture documents in Inkie; stop any test publishing connections as appropriate.

## Form and review completion notes

For the plugin submission, listing fields are sourced from the manifest and README, so this file's alternative copy does not change the manifest. The portal also asks for data handling and compliance answers. Submitters must make their own policy acknowledgements after confirming the missing evidence. Repository validation and webhook setup require appropriate GitHub access. See [Anthropic's plugin submission guide](https://claude.com/docs/plugins/submit).

For the connector, use the name, tagline, long description, categories and URLs above. Choose a permanent slug only after checking availability. Supply a private reviewer login and confirmed OAuth details. Check live tool titles and read/write or destructive annotations; the portal can flag missing metadata, and the server supplies tool titles and marks replacement, update and deletion tools destructive. Do not state that all tools have been exercised based on mocks alone.

**NEEDED from Simon before completion:** public support and review contacts; approved privacy URL and hosted data handling answers; reviewer account and populated fixtures; confirmed OAuth registration details and live results; approved icon; any demonstration screenshots the portal asks for; owning organisation and release/update choices; accurate compliance acknowledgements.
