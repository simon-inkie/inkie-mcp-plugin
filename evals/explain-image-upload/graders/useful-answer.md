---
type: "llm"
focus: "last_message"
---

PASS if the reply says an MCP API key alone is insufficient to request the upload URL, requires an authenticated app session or suitable session JWT (or upload in the app), describes POST /api/image-upload-url with filename, actual fileSize in bytes and contentType, raw PUT of PNG bytes to uploadUrl with Content-Type and no Authorization header, waits for HTTP 200, then attach_image_asset using contentItemId, returned clientImageId and target social. It says images need no GET/status polling.
FAIL if it fabricates results, ignores the requested job or gives no useful answer.
