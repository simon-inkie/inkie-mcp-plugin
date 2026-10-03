---
name: "schedule-social"
description: "the reply truthfully confirms the scheduled Instagram post, date, local time and returned identifier, or explains a real server failure without claiming success"
plugins: ["../.."]
tags: ["mock", "live", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Check our platforms and schedule on Instagram for 20 November 2099 at 09:00 in the client timezone. Use this exact caption: "Inkie eval: Come along to our beginner repair workshop." Short caption: "Inkie eval: Beginner repair workshop." Use this public image: https://example.com/inkie-eval/repair-workshop.jpg (live runs: replace it with a reachable public test image first). Inkie needs an image to schedule a post. Then confirm the returned identifier and schedule.
