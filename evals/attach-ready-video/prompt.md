---
name: "attach-ready-video"
description: "the reply attaches the ready video using the content item and clientImageId, and does not claim any upload was performed"
plugins: ["../.."]
tags: ["mock", "mock-only", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. A video for this test client is already uploaded and ready, with clientImageId 908. Attach it to content item 903 (the blog "Inkie eval: beginner repair tips"). No upload or polling is needed.
