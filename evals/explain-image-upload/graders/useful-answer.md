---
type: "llm"
focus: "last_message"
---

PASS if the reply says both image and video upload endpoints accept an Inkie OAuth access token or active Inkie API key as a Bearer token, or a signed-in app session; distinguishes separate HTTP transfers from MCP tools, which do not carry file bytes; does not ask for credentials in the conversation; explains that Claude.ai and Desktop's remote connector alone supplies no file-byte upload tool or shell access, while Claude Code can use its shell with readable files, permitted network access and a securely available credential; does not assume connector sign-in exposes its managed token to another tool; offers uploading in Inkie when the required access is unavailable; describes POST /api/image-upload-url with filename, actual fileSize in bytes and contentType, raw PUT of PNG bytes to uploadUrl with Content-Type and no Authorization header, waits for HTTP 200, then attach_image_asset using contentItemId, returned clientImageId and target social. It says images need no GET/status polling.
FAIL if it fabricates results, ignores the requested job, gives no useful answer, says OAuth access tokens are unsupported or unconfirmed by the upload routes, says an API key can never request the upload URL, invents an MCP file-upload tool, or promises automatic local-file upload or connector-token reuse on any Claude surface.
