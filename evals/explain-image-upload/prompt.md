---
name: "explain-image-upload"
description: "the reply explains OAuth/API-key/session authentication, separate HTTP upload and attachment, each Claude surface's file/HTTP/credential requirements, and app upload as a fallback, without exposing credentials or promising automatic token reuse"
plugins: ["../.."]
tags: ["mock", "offline", "read-only", "image"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. I have a local PNG image and have connected Inkie with OAuth; I also have an Inkie API key available outside this conversation. Explain how to upload and attach the image to a blog promo image, including the authentication and HTTP steps. Can Claude do it for me in Claude.ai, Desktop or Code? Does connector sign-in alone make the token available for upload? Do not upload, attach or make any network calls.
