#!/bin/bash
# Build PDF from HTML cheatsheet using Chrome headless
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
INPUT="${1:-$DIR/cheatsheet.html}"
OUTPUT="${2:-${INPUT%.html}.pdf}"

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

if [[ ! -x "$CHROME" ]]; then
  echo "Error: Google Chrome not found at $CHROME" >&2
  exit 1
fi

"$CHROME" --headless --disable-gpu --no-margins --print-to-pdf-no-header \
  --print-to-pdf="$OUTPUT" "$INPUT" 2>/dev/null

echo "PDF saved: $OUTPUT ($(du -h "$OUTPUT" | cut -f1 | xargs))"
