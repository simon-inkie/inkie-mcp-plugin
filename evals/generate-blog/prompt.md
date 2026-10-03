---
name: "generate-blog"
description: "the reply truthfully reports the blog generation state and identifier; if ready, it provides its title and a relevant repair summary, otherwise it clearly says processing or failed"
plugins: ["../.."]
tags: ["mock", "live", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Check platforms, then use Inkie AI to generate and schedule a WordPress blog on simple repairs for beginners for 22 November 2099 at 10:00 local time. Include "Inkie eval:" in the topic. Check status; when ready, show the title and a useful summary.
