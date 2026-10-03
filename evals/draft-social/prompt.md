---
name: "draft-social"
description: "the reply provides a warm, practical caption about a beginner repair workshop, without unsupported claims or saying it was scheduled"
plugins: ["../.."]
tags: ["mock", "read-only"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. Read our brand information and draft an Instagram caption about a beginner repair workshop. Keep it in this conversation; do not save or schedule anything.
