# Inkie plugin evals

This suite follows Claude Code's `prompt.md` plus `graders/*.md` format, not the separate skill-creator JSON format. Requires Claude Code v2.1.269 or later, normal Claude/model-provider authentication, and Python 3 for the live wrapper. If Git is installed, the eval CLI requires Git 2.31 or later.

## Default mocked comparison

From the plugin root:

```bash
claude plugin eval . --mocks record --ablation with-without --no-publish --no-scaffold
```

No Inkie key or real server is needed. Fixed mocks in `evals/mocks/inkie/` return fictional test-client data and guard key arguments. `_tools.json` contains the real tool descriptions and schemas captured read-only from the server's schema definitions, with the mock client's Instagram, Facebook, Bluesky and WordPress/Wix choices. No remote discovery was called. Real accounts have dynamic platform schemas.

Mocked runs still call Claude and the LLM judges using your normal authentication. The default three runs per arm means 72 agent runs for 12 cases, plus judge calls. For one inexpensive iteration:

```bash
claude plugin eval . --case attach-uploaded-image --mocks record --runs 1 --ablation none --no-publish --no-scaffold
```

`with-without` runs a no-plugin baseline. Skill activation and MCP routing graders are marked as plugin-only indicators; outcome rubrics score both arms. Read the routing indicators as well as the score delta: the baseline has no plugin tools, so the delta measures the whole bundle, not just the skill's wording. For strict routing scores, use `--ablation none`; indicators then contribute to the score:

```bash
claude plugin eval . --mocks record --ablation none --no-publish --no-scaffold
```
 The CLI's default threshold is 1.0. Results and local HTML reports go under `evals/results/`. They can contain tool output, so use only fictional test data and keep them private.

## Cases and real data

Every case runs with mocks by default. None requires the real MCP server to exercise routing. The `live` tag identifies six cases that can also test the actual integration. All writes explicitly name **Inkie Plugin Eval Test Client**, a fictional dedicated test client. Naming it in the prompt does not change authentication.

| Case | Job | Real server | Live effect |
| --- | --- | --- | --- |
| `draft-social` | Read brand information and draft a caption without scheduling | Mock only | None |
| `review-content-plan` | Read November 2099 plan and propose gaps | Optional, `live` | Reads plan |
| `read-brand` | Read business overview, audience and voice | Optional, `live` | Reads onboarding |
| `schedule-social` | Schedule exact Instagram copy | Optional, `live` | Creates scheduled social item |
| `generate-social` | Generate, poll and retrieve a social post | Optional, `live` | Creates scheduled AI social item |
| `generate-blog` | Generate, poll and retrieve a WordPress blog | Optional, `live` | Creates scheduled AI blog item |
| `capture-idea` | Append a November 2099 content idea | Optional, `live` | Appends to monthly ideas document |
| `reschedule-item` | Discover an item and move it across months | Mock only | None in supported live run |
| `edit-caption` | Edit caption using the required `blogId` argument | Mock only | None in supported live run |
| `attach-uploaded-image` | Attach a successful uploaded image to a blog promo | Mock only | None in supported live run |
| `explain-image-upload` | Explain session-authenticated POST, raw PUT and attachment | Offline explanation | No upload, attachment or network calls requested |
| `update-business-overview` | Preserve and update an onboarding document | Mock only | None in supported live run |

Mock-only mutations use fake identifiers and should not be run with `--mocks off`. The image attachment case checks numeric asset/item IDs and `target: social`; the explanation case checks the complete image upload contract and authentication limitation. It does not simulate HTTP transfers or prove uploaded bytes exist. A real image upload needs a suitable app session or session JWT, not merely an MCP API key. No real upload case is enabled.

## Live test-account run

Prepare a dedicated client named **Inkie Plugin Eval Test Client**, with fictional business overview and target-audience documents, client timezone **Europe/London**, and test Instagram and WordPress connections. Ensure the tools actually discover these platforms. Review the November 2099 plan if you want non-empty plan-read coverage. Scheduled dates are in 2099 to avoid imminent publication, but the run creates actual records and generation jobs. Use test publishing destinations only. Repeated runs create duplicates and append repeated ideas; inspect and clean up in the app afterwards. There is no automatic deletion.

Get the key from this client's Settings → API keys and enter it without echoing:

```bash
read -r -s -p 'Test-client Inkie API key: ' INKIE_MCP_API_KEY
printf '\n'
export INKIE_MCP_API_KEY
bash scripts/eval-live.sh --runs 1
```

This is the supported exact test-key command. The wrapper runs:

```bash
claude plugin eval "$eval_plugin_dir" \
  --mocks off \
  --ablation with-without \
  --no-publish \
  --no-scaffold \
  --output-dir "$plugin_root/evals/results/live-$(date -u +%Y%m%dT%H%M%SZ)" \
  --runs 1 \
  --tag live \
  --allow-tools 'mcp__plugin_inkie_inkie__*'
```

The wrapper's `eval_plugin_dir` is a temporary copy of the authored plugin components, removed on exit. Its `plugin_root` is this plugin's directory. No secrets are written to the copy: the wrapper exports `EVAL_INKIE_MCP_API_KEY` from `INKIE_MCP_API_KEY`, and changes only the temporary config's placeholder to `${EVAL_INKIE_MCP_API_KEY}`. Eval children inherit `EVAL_*` but strip ordinary custom variables, so a direct live command using the canonical `${INKIE_MCP_API_KEY}` reference loses its key. The shipped plugin configuration remains unchanged.

Required environment: `INKIE_MCP_API_KEY` for the live wrapper, plus normal Claude authentication or your normal model-provider variables (for example `ANTHROPIC_API_KEY` when using that provider). The wrapper creates the `EVAL_*` alias; never put either key value in case frontmatter. It does not verify which client owns the key, so check that in Inkie before running. The first eval run may ask whether you trust this plugin; `--trust-plugin` can be added only after reviewing the files. The real server runs as you, and the MCP grant applies across the selected cases.

## Safe validation performed

Manifest validation and static file checks do not require a key or model calls. The CLI help offers no dry-run option. `--mocks record` is a behavioural model run, not an offline validator. No behavioural eval, real MCP request or upload was run during packaging. Run validation separately with:

```bash
claude plugin validate .
```
