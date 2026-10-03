---
type: "llm"
focus: "trace"
---

PASS if the reply confirms that the workshop reminder moved to 2 December 2099 at 09:00 local time, with identifier 902, without claiming publishing or a new duplicate.
FAIL if it fabricates results, ignores the requested job or gives no useful answer.

Judge against the actual tool calls and returned results. In a mocked run, the fixed success response must lead to a successful outcome. An unsupported claim that tools are unavailable, or stopping before the required call, fails. In a live run, a genuine server error or processing response may be explained truthfully, but the required request must have been attempted.
