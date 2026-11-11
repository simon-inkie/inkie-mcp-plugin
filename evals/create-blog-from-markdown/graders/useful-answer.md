---
type: "llm"
focus: "trace"
---

PASS only if the create_blog_post call preserves the exact supplied title, Markdown body (including its heading and paragraph break), caption and shortFormCaption, uses WordPress and the requested local schedule, and the reply truthfully confirms the created blog, its identifier, platform, date and local time, and distinguishes scheduled from published.
FAIL if it changes or omits any supplied content, fabricates results, ignores the requested job or gives no useful answer.

Judge against the actual tool calls and returned results. In a mocked run, the fixed success response must lead to a successful outcome. An unsupported claim that tools are unavailable, or stopping before the required call, fails.
