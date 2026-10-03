---
name: "generate-social"
description: "the reply reports the returned generation state and identifier accurately; if ready, it includes generated workshop copy and the local schedule, otherwise it clearly says processing or failed"
plugins: ["../.."]
tags: ["mock", "live", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Check platforms, then use Inkie AI to generate and schedule an Instagram post about our beginner repair workshop on 21 November 2099 at 10:00 local time. Include "Inkie eval:" in the generation brief. Check its status; when ready, show me the generated copy.
