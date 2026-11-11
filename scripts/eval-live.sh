#!/usr/bin/env bash
set -euo pipefail

# EVAL-ONLY path. The shipped .mcp.json has no credentials and signs in with OAuth.
# Non-interactive eval runs cannot complete a browser sign-in, so this wrapper
# writes a private temporary config that adds a test-client API key as a Bearer
# header. Never copy that header into the shipped .mcp.json.
# The eval child only inherits EVAL_* and provider/basic variables, so the key is
# passed as EVAL_INKIE_MCP_API_KEY.
: "${INKIE_MCP_API_KEY:?Set INKIE_MCP_API_KEY to the dedicated test-client key}"
export EVAL_INKIE_MCP_API_KEY="$INKIE_MCP_API_KEY"
plugin_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
eval_plugin_dir="$(mktemp -d "${TMPDIR:-/tmp}/inkie-plugin-eval.XXXXXXXX")"
trap 'rm -rf -- "$eval_plugin_dir"' EXIT
python3 - "$plugin_root" "$eval_plugin_dir" <<'PY'
from pathlib import Path
import json
import shutil
import sys
source, target = map(Path, sys.argv[1:])
# Copy only authored plugin/eval components, never environment or agent folders.
for name in ('.claude-plugin', 'skills', 'evals'):
    shutil.copytree(source / name, target / name, ignore=shutil.ignore_patterns('results'))
config = json.loads((source / '.mcp.json').read_text())
config['mcpServers']['inkie']['headers'] = {'Authorization': 'Bearer ${EVAL_INKIE_MCP_API_KEY}'}
(target / '.mcp.json').write_text(json.dumps(config, indent=2) + '\n')
PY
claude plugin eval "$eval_plugin_dir" \
  --mocks off \
  --ablation with-without \
  --no-publish \
  --no-scaffold \
  --output-dir "$plugin_root/evals/results/live-$(date -u +%Y%m%dT%H%M%SZ)" \
  "$@" \
  --tag live \
  --allow-tools 'mcp__plugin_inkie_inkie__*'
