---
type: "llm"
focus: "trace"
---

PASS if the reply gives a correct Python Fibonacci function without drawing on marketing or Inkie content.
FAIL if it fabricates results, ignores the requested job or gives no useful answer.

Judge against the actual tool calls and returned results. In a mocked run, the fixed success response must lead to a successful outcome. An unsupported claim that tools are unavailable, or stopping before the required call, fails.
