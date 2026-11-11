# Inkie OpenAI submission preparation

Status: DRAFT — not ready for submission. No upload, submission or publication performed.

This branch adds the portable OpenAI package without replacing the Claude package.
Use root plugin.json, mcp.json, assets/ and skills/. The existing SUBMISSION.md and
EVALS.md describe Claude and are not OpenAI submission instructions or test evidence.

## Confirmed publisher choices

- Intended publisher: Inkie; verification pending. simon@inkie.ink is a contact, not a verified business identity.
- All available countries: publication.countries is deliberately [].
- Paid Inkie subscription, 14-day free trial, checkout inside Inkie.
- Proposed listing: Inkie / Plan and create marketing / Business & Operations.
- Optional dark icons and brand colours omitted; may be added if desired.

## Package changes

Root Agent Plugins 1.0 manifest and portable Streamable HTTP MCP configuration.
Listing, review prompts, five positive and three negative cases, commerce declaration,
release notes and country targeting are embedded in plugin.json.
Existing 1024 x 1024 PNG branding is reused in assets/icon.png.
The skill uses host-neutral upload guidance rather than assuming Claude shell access.
The public archive excludes Claude compatibility manifests, mocks, Git, credentials
and old submission documents. No private app bindings are included.

## Outstanding preparation

1. Verify the publisher identity in the intended OpenAI organization.
2. Supply/verify a public support page. https://www.inkie.ink/contact timed out twice
   in the web reader; it is intentionally absent from the manifest pending verification.
3. Review listing and cases for intended behaviour. All eight cases are NOT RUN.
   Dedicated fictional test account and November 2099 fixtures are described in cases.
4. Verify OAuth sign-in and deployed tools/list annotations. Mock schemas include
   readOnlyHint, destructiveHint and openWorldHint; they do not establish live correctness.
   No live writes or production-account tests have been performed.
5. Record and host an actual demo; demo_recording_url is absent until verified.
6. Prepare secure reviewer access in the portal, never in the ZIP. If using email-code
   or magic-link login, invite mcp-review@theaicompany.org to the dedicated test workspace.

## Verified public material

Website/docs: https://app.inkie.ink/docs/mcp identifies endpoint and Streamable HTTP/OAuth.
Privacy: https://www.inkie.ink/privacy-policy includes ChatGPT/Claude processing,
service providers, retention, deletion and contact details.
Terms: https://www.inkie.ink/terms-and-conditions applies to the website and services.
Do not use /app-terms: it is expressly for the Wix connector.
Checks were performed on 11 November 2026. Policy accuracy remains the publisher's responsibility.
The docs' video polling identifier conflicts with this skill (clientImageId vs uploadId);
verify the deployed endpoint contract before recording that workflow.

## Demo walkthrough (recording still required)

Use the development connection for the exact version being packaged, with fictional data.
1. Show the installed version and authenticated dedicated test workspace, hiding credentials.
2. Ask: Read my brand information and draft a caption for a pottery workshop. Do not save it.
   Show real tool results and the grounded draft, with no writes.
3. Ask: Review my November 2099 content plan and suggest three gaps. Do not change anything.
   Show actual returned plan items and the summary.
4. Ask: Save this idea for November 2099: a behind-the-scenes video preparing the pottery studio.
   Show the actual successful save and read it back.
5. Ask: Refund my Inkie subscription payment. Show the unsupported-operation explanation.
Read through results slowly enough to be legible. Do not expose tokens, customer data
or signed media URLs. Replay the saved recording, host it at a reviewer-accessible URL
and verify playback before adding demo_recording_url and rebuilding.
Computer control can assist the walkthrough if desired; screen recording must be
available separately. No recording has been made or claimed.

## Final portal work (after preparation)

Upload only when the draft gaps are resolved. Verify imported values, connect the
saved remote server via OAuth, run cases against that saved version, check domain
verification and required scans, and complete legal attestations personally.
Uploading a draft, submitting for review and publishing are separate actions.
