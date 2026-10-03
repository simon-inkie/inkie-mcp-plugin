---
type: "llm"
focus: "trace"
---

PASS if the reply truthfully confirms the scheduled Instagram post, date, local time and returned identifier, or explains a real server failure without claiming success.
FAIL if it fabricates results, ignores the requested job or gives no useful answer.

Judge against the actual tool calls and returned results. In a mocked run, the fixed success response must lead to a successful outcome. An unsupported claim that tools are unavailable, or stopping before the required call, fails. In a live run, a genuine server error or processing response may be explained truthfully, but the required request must have been attempted.
