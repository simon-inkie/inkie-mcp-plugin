---
name: "update-business-overview"
description: "the reply confirms the business overview was updated with the beginners information, preserves the existing business facts and does not expose the internal onboarding prompt"
plugins: ["../.."]
tags: ["mock", "mock-only", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Read our business overview and its onboarding guidance. Preserve its existing facts, and add that beginner repair workshops welcome adults with no previous experience. Save the updated overview with title "Business overview".
