---
type: "llm"
focus: "trace"
---

PASS if the reply explains the business, audience and voice from the returned overview, or clearly identifies missing information rather than inventing it.
FAIL if it fabricates results, ignores the requested job or gives no useful answer.

Judge against the actual tool calls and returned results. In a mocked run, the fixed success response must lead to a successful outcome. An unsupported claim that tools are unavailable, or stopping before the required call, fails. In a live run, a genuine server error or processing response may be explained truthfully, but the required request must have been attempted.
