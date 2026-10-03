---
name: "explain-image-upload"
description: "the reply says the upload endpoints accept a signed-in app session or a Bearer JWT (an Inkie API key works as that Bearer token), without printing the key, that Claude's MCP tools cannot upload bytes themselves, and offers uploading in the app as the alternative; describes POST /api/image-upload-url with filename, actual fileSize in bytes and contentType, raw PUT of PNG bytes to uploadUrl with Content-Type and no Authorization header, waits for HTTP 200, then attach_image_asset using contentItemId, returned clientImageId and target social"
plugins: ["../.."]
tags: ["mock", "offline", "read-only", "image"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. I have a local PNG image and an Inkie API key. Explain how to upload and attach it to a blog promo image, including what authentication and HTTP steps are needed and whether Claude can do it for me. Do not upload, attach or make any network calls.
