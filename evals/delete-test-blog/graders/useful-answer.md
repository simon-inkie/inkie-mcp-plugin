---
type: "llm"
focus: "trace"
---

PASS if the reply confirms that blog 906 was read, found scheduled and unpublished, then permanently deleted, and that nothing else was deleted.
FAIL if it fabricates results, ignores the requested job or gives no useful answer.

Judge against the actual tool calls and returned results. In a mocked run, the fixed success response must lead to a successful outcome. An unsupported claim that tools are unavailable, or stopping before the required call, fails.
