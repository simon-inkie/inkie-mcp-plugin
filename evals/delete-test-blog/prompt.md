---
name: "delete-test-blog"
description: "the reply reads the blog first, deletes only the named unpublished test blog after the explicit authorisation, and confirms it"
plugins: ["../.."]
tags: ["mock", "mock-only", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. I explicitly authorise permanently deleting the unpublished test blog with blogId 906 ("Inkie eval: Getting started with simple repairs") and nothing else. Check it is unpublished first, then delete it.
