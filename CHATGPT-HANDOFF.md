# ChatGPT plugin handoff and checklist

Updated: 11 November 2026. Working branch: `chatgpt-submission`.

Goal: prepare Inkie's existing MCP service and plugin for public OpenAI submission.
No upload, review submission or publication has been performed. Treat the package as a draft.
Update this checklist with evidence, dates and results as work progresses; do not include secrets.

## Completed package work

- [x] Added root `plugin.json` in Agent Plugins 1.0 format.
- [x] Added portable `mcp.json`, using Streamable HTTP and OAuth at https://app.inkie.ink/api/mcp.
- [x] Added listing fields, prompts, five positive and three negative review cases.
- [x] Recorded intended publisher Inkie, worldwide targeting (`countries: []`), paid subscription,
  14-day free trial and checkout inside the Inkie app.
- [x] Added release notes and reused the supplied 1024 x 1024 PNG icon in `assets/icon.png`.
- [x] Replaced Claude-specific upload assumptions in the skill with host-neutral guidance.
- [x] Added `Build-OpenAI.ps1` and detailed `OPENAI-SUBMISSION.md` preparation notes.
- [x] Ran local structural checks and inspected archive inventory/JSON. Mock annotation types
  checked for 24 tools; zero missing boolean annotation fields. This is not live validation.
- [x] Checked published privacy policy and general terms. `/app-terms` covers Wix specifically;
  use `/terms-and-conditions` for the general service.

Existing `.claude-plugin/`, `.mcp.json`, `SUBMISSION.md`, `EVALS.md` and mock evals remain for
Claude compatibility. They are not OpenAI submission evidence. Do not bundle the old
Claude submission guide or mocks into the public OpenAI archive.

## Publisher and listing

- [ ] Business verification approved in the intended OpenAI organization. Simon has started
  this and expects a wait of several days. Publisher name must match the verified identity;
  `simon@inkie.ink` is a contact, not an identity verification substitute.
- [ ] Confirm listing copy and category (`Business & Operations`) describe the deployed service.
- [x] Verify https://www.inkie.ink/contact publicly loads without login and offers a working (Done 11 Nov: returned 200 in about 1 s, no login.)
  support email/form. It timed out twice during preparation; do not assume it is broken.
- [x] Add the verified URL to `extensions.com.openai.interface.supportURL`. (Done 11 Nov: set to https://www.inkie.ink/contact. Page content not read for sign-in help wording.)
  Page should identify Inkie and offer help with connection/sign-in and content workflows;
  privacy/terms links are recommended. No separate support site is required.
- [ ] Confirm privacy/terms accurately cover the deployed integration and data practices.
- [ ] Optionally add approved dark icons/brand colours; absence does not block preparation.

## Service implementation and live checks

- [x] Verify OAuth discovery, registration method, consent, sign-in and reconnect with ChatGPT. (Done 11 Nov: ChatGPT new connection and reconnect worked on the dev instance, and discovery passes on prod. Re-test on prod after the prod deploy.)
  Root MCP auth currently declares OAuth only. Add verified client-registration/scopes/endpoints
  if needed; do not guess or put secrets in the package.
- [ ] Verify live `tools/list` schemas and boolean `readOnlyHint`, `openWorldHint`,
  `destructiveHint` values against actual behaviour for every exposed tool.
- [x] Verify unauthenticated access is rejected and account isolation is correct. (Done 11 Nov: unauthenticated POST to /api/mcp returns 401 with a Bearer WWW-Authenticate header. Account isolation not tested.)
- [x] Confirm all creation/generation requires in-app approval before publishing. (Done 11 Nov: live eval run created a post that came back approval_required.)
- [ ] Confirm image/video upload authorization and replacement semantics. A managed MCP OAuth
  token is not automatically available to shell/HTTP tools. Do not invent a file upload tool.
- [x] Resolve public docs vs skill mismatch for video status polling: docs say clientImageId, (Done 11 Nov: docs and skill both say poll with uploadId, attach with clientImageId.)
  skill says uploadId/provider asset ID. Confirm deployed contract and align docs/instructions.
- [ ] Confirm server limits for video type, size and processing readiness; publish accurate guidance.
- [ ] Verify read-only workflows, creation, generation polling/readback, edits, rescheduling,
  ideas, onboarding updates, image replacement, media attachments and deletion on test fixtures.
- [ ] Verify negative cases and prompt-injection handling without inappropriate tool calls.
- [ ] Record Passed/Failed/Blocked/Not run, actual calls/arguments/results and exact tested
  package/server version. All eight embedded review cases are currently NOT RUN.
  Existing mock evals do not establish a live pass or all-tools-tested attestation.

## Live check notes (11 Nov, Io)

- tools/list on prod returns 24 tools, all with boolean readOnlyHint, destructiveHint and openWorldHint (none missing).
- FLAG: openWorldHint is false on every tool, including create, generate and update tools that publish to external social or blog channels. OpenAI may expect true for those; decide before submitting. Needs an app change, not a package change.
- Live evals (not the eight embedded cases): 5 of 6 pass on the test client; see the brain checklist.
- Video size and format limits: not yet confirmed from the implementation.

## Test account and fixtures

Simon reports a dedicated test account and editable content are already prepared.

- [ ] Confirm fictional business/audience/voice docs, timezone and enabled test destinations.
- [ ] Confirm November 2099 content plan and saved ideas match the embedded case setup,
  or update case dates/setup consistently to match actual fixtures.
- [ ] Provide disposable unpublished social and blog items for edits/rescheduling/deletion.
- [ ] Upload a sample image to the test account in Inkie's normal media flow. PNG/JPEG below
  10 MiB is a simple choice; skill documents PNG/JPEG/GIF/WebP/SVG and a 10 MiB image limit.
- [ ] Upload a short sample video through Inkie and wait for READY processing status.
  Video format/size limits still require confirmation from deployed implementation.
- [ ] Have an HTTPS image URL accessible without login for create-from-copy/update-image tests.
  Private uploaded asset IDs are a separate workflow, not substitutes for public image URLs.
- [ ] Discover actual item/asset identifiers from tool responses; never fabricate IDs.
- [ ] Ensure fixtures are disposable: image attachment replaces the targeted image, and video
  attachment can remove existing images. Keep production customer data out of testing.
- [ ] Prevent accidental publication via test destinations/approval controls; clean up test writes.

## Demo and reviewer access

- [ ] Rehearse the walkthrough in `OPENAI-SUBMISSION.md` on the development connection
  using the exact version being packaged, with real tool results and fictional data.
- [ ] Record prompts, returned results and unsupported-operation behaviour legibly.
  A walkthrough script or screenshots are not a completed recording.
- [ ] Replay and check the recording for readability and exposed secrets/customer data.
- [ ] Host the recording so reviewers can view it without requesting access; verify playback.
- [ ] Add actual URL as `extensions.com.openai.review.demo_recording_url` and rebuild.
- [ ] Put reviewer username/password, login URL, test business and sign-in steps only in
  the portal's private reviewer-access fields. Never in Git, ZIP, public docs or chat.
- [ ] Ensure sign-in needs no code from Simon's personal inbox or phone. For magic-link/email
  code access, invite `mcp-review@theaicompany.org` to the dedicated test workspace.

## Build and final handback

Run PowerShell from this repository, supplying a new absolute archive path outside the repo:

```powershell
./Build-OpenAI.ps1 -OutputPath 'C:\path\outside-repo\inkie-openai-0.1.0.zip'
```

The script intentionally packages only `plugin.json`, `mcp.json`, `assets/icon.png`,
`skills/inkie-marketing/SKILL.md` and `LICENSE`. Update the allowlist if adding required
assets/references. Keep archives out of Git. The script runs structural checks, not a full
OpenAI schema/portal validator, and warns about currently missing support/demo fields.

- [ ] Rebuild after final metadata/skill edits and inspect the actual ZIP contents.
- [ ] Run available target schema/portal validation; resolve all package findings.
- [ ] Hand back branch/commit, ZIP, updated checklist and non-secret test evidence for recheck.
- [ ] After preparation is complete and upload is authorized: inspect imported metadata,
  verify domain, connect the saved MCP version, run review cases against it, and resolve scans.
- [ ] Simon completes legal/policy attestations personally. Uploading, submitting for review
  and publishing are separate actions; none is authorized by simply building the package.

Reference: https://developers.openai.com/plugins/deploy/submission
