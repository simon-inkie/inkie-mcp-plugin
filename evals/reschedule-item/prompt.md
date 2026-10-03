---
name: "reschedule-item"
description: "the reply confirms that the workshop reminder moved to 2 December 2099 at 09:00 local time, with identifier 902, without claiming publishing or a new duplicate"
plugins: ["../.."]
tags: ["mock", "mock-only", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Read the November 2099 plan and move its unpublished "Inkie eval: repair workshop reminder" social item to 2 December 2099 at 09:00 local time. Keep the content unchanged.
