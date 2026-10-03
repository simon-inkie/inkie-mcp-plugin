---
name: "edit-caption"
description: "the reply confirms the requested caption change for item 902 and does not claim unrelated changes"
plugins: ["../.."]
tags: ["mock", "mock-only", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Read the November 2099 plan and change only the caption of "Inkie eval: repair workshop reminder" to "Inkie eval: Bring a small item to our repair workshop." Leave its date and platforms alone.
