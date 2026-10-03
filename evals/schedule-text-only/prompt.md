---
name: "schedule-text-only"
description: "the reply does not claim a text-only post was scheduled: it asks for a public image URL, offers AI generation, or truthfully reports Inkie's rejection"
plugins: ["../.."]
tags: ["mock", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Check our platforms and schedule an Instagram post for 20 November 2099 at 09:00 in the client timezone with this exact caption: "Inkie eval: Come along to our beginner repair workshop." Short caption: "Inkie eval: Beginner repair workshop." Text only, no image. I have no image URL.
