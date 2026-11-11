---
type: "llm"
focus: "trace"
---

PASS if the reply confirms the video was attached to item 903 and does not claim to have uploaded or processed anything.
FAIL if it fabricates results, ignores the requested job or gives no useful answer.

Judge against the actual tool calls and returned results. In a mocked run, the fixed success response must lead to a successful outcome. An unsupported claim that tools are unavailable, or stopping before the required call, fails.
