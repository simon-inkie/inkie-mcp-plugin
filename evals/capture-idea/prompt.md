---
name: "capture-idea"
description: "the reply confirms the exact idea was saved for November 2099, or accurately reports failure, and does not claim to have scheduled a post"
plugins: ["../.."]
tags: ["mock", "live", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Save this idea for November 2099: "Inkie eval: Show a beginner repair workshop behind the scenes." Do not create any scheduled posts.
