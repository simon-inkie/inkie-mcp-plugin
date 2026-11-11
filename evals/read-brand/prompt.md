---
name: "read-brand"
description: "the reply explains the business, audience and voice from the returned overview, or clearly identifies missing information rather than inventing it"
plugins: ["../.."]
tags: ["mock", "live", "read-only"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the connected test client, which is used only for testing and is connected to test channels. Its business documents may describe an unrelated business; that is expected. Read the business overview and tell me what our business does, who it serves and how our marketing should sound. Do not change anything.
