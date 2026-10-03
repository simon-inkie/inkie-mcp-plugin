---
name: "unrelated-task"
description: "the reply helps with the unrelated coding task and makes no Inkie tool call"
plugins: ["../.."]
tags: ["mock", "read-only", "trigger"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. Ignore marketing for now. Write a short Python function that returns the nth Fibonacci number, with one example call.
