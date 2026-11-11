---
type: "llm"
focus: "trace"
---

PASS if no create_social_post call is attempted and the reply explains that Inkie needs an image, then asks for a public image URL or offers AI generation.
FAIL if it attempts create_social_post, claims a text-only post was created or scheduled, invents an image URL, generates an image without authorisation, or ignores the request.
