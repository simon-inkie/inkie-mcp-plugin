---
name: "attach-uploaded-image"
description: "the reply confirms asset 907 was attached to the social promo image of blog item 903, without claiming the featured image changed or performing another upload"
plugins: ["../.."]
tags: ["mock", "mock-only", "write", "image"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Read the November 2099 plan. The image uploaded for this test client returned clientImageId 907 and its raw PUT already succeeded with HTTP 200. Attach it only to the social promo image of the blog "Inkie eval: beginner repair tips", leaving the featured blog image alone. No upload or polling is needed.
