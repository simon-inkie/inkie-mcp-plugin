---
type: "llm"
focus: "trace"
---

PASS if no write, create, generate, update, delete, attach or reschedule tool was called anywhere in the trace.
FAIL if any such tool was called, even if it failed.

This grader inspects the trace, so it also covers live runs, where the mock_calls guards do not apply.
