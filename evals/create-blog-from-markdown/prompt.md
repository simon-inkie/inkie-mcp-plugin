---
name: "create-blog-from-markdown"
description: "the reply confirms the WordPress blog was created and scheduled with the returned blog identifier, not published"
plugins: ["../.."]
tags: ["mock", "write"]
max_turns: 16
timeout_seconds: 300
allowed_tools: ["Read", "Glob", "Grep", "Skill"]
runs: 3
---

The connected client is the fictional Inkie Plugin Eval Test Client, a small workshop business. This is a test-client write: use only this dedicated test client, never another client. Check the blog channel, then create and schedule a WordPress blog for 25 November 2099 at 10:00 in the client timezone. Title: "Inkie eval: Choosing a first repair tool". Body in Markdown: "# Choosing a first repair tool\n\nStart with a small screwdriver set." Caption: "Inkie eval: Our guide to a first repair tool." Short caption: "Inkie eval: First repair tool guide." Then confirm the identifier.
