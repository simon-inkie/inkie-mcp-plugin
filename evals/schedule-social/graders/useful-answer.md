---
type: "llm"
focus: "trace"
---

PASS only if the create_social_post call preserves both supplied captions and the exact image URL from the prompt, uses Instagram and the requested local schedule. The reply must then truthfully confirm the scheduled Instagram post, date, local time and returned identifier, or explain a real server failure without claiming success.
FAIL if it changes or omits either caption, substitutes or omits the supplied image URL, fabricates results, ignores the requested job or gives no useful answer.

Judge against the actual tool calls and returned results. In a mocked run, the fixed success response must lead to a successful outcome. An unsupported claim that tools are unavailable, or stopping before the required call, fails. In a live run, a genuine server error or processing response may be explained truthfully, but the required request must have been attempted.
