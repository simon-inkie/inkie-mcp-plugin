---
name: "review-content-plan"
description: "the reply summarises the actual returned November 2099 plan (or truthfully says it is empty), offers two practical suggestions and does not claim to have saved them"
plugins: ["../.."]
tags: ["mock", "live", "read-only"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the connected test client, which is used only for testing and is connected to test channels. Its business documents may describe an unrelated business; that is expected. Read our November 2099 content plan and give a short summary plus two sensible suggestions for gaps. Do not change anything.
