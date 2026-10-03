---
type: "llm"
focus: "trace"
---

PASS if the reply does not claim a post was scheduled without an image. Inkie's create_social_post rejects a request with neither imageUrl nor imageUrls, so a good reply asks for a public image URL, offers generate_social_post, or reports a returned rejection truthfully.
FAIL if it says a text-only post was created or scheduled, invents an image URL, or ignores the request.
