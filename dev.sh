#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
TOKEN="${JUPYTER_TOKEN:-$(openssl rand -hex 4)}"
printf '\n  >>> Jupyter token: %s <<<\n\n' "$TOKEN"
exec jupyter lab \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --ServerApp.token="$TOKEN" \
    "$@"
