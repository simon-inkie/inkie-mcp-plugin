---
type: "llm"
focus: "last_message"
---

PASS if the reply says POST /api/image-upload-url accepts a signed-in app session or a Bearer JWT (an Inkie API key works as that Bearer token), does not ask the user to paste the key into the conversation, notes that the MCP tools cannot upload bytes themselves and offers uploading in Inkie as the alternative, describes POST /api/image-upload-url with filename, actual fileSize in bytes and contentType, raw PUT of PNG bytes to uploadUrl with Content-Type and no Authorization header, waits for HTTP 200, then attach_image_asset using contentItemId, returned clientImageId and target social. It says images need no GET/status polling.
FAIL if it fabricates results, ignores the requested job, gives no useful answer, or says an API key can never request the upload URL.
