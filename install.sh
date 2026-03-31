#!/bin/bash
# DotLang installer for Claude Code + Espanso
# Usage: curl -fsSL https://raw.githubusercontent.com/dimonchoo/dotlang/main/install.sh | bash
set -euo pipefail

DOTLANG_DIR="$HOME/.claude/dotlang"
CLAUDE_MD="$HOME/.claude/CLAUDE.md"
IMPORT_LINE="@$DOTLANG_DIR/CLAUDE.md"
BASE_RAW="https://raw.githubusercontent.com/dimonchoo/dotlang/main"
ESPANSO_DIR="$HOME/Library/Application Support/espanso/match"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { printf "${GREEN}[dotlang]${NC} %s\n" "$1"; }
warn()  { printf "${YELLOW}[dotlang]${NC} %s\n" "$1"; }
error() { printf "${RED}[dotlang]${NC} %s\n" "$1" >&2; exit 1; }

# Uninstall mode
if [[ "${1:-}" == "--uninstall" ]]; then
  if [[ -d "$DOTLANG_DIR" ]]; then
    rm -rf "$DOTLANG_DIR"
    info "Removed $DOTLANG_DIR"
  fi
  if [[ -f "$CLAUDE_MD" ]] && grep -qF "$IMPORT_LINE" "$CLAUDE_MD"; then
    sed -i '' "/$(echo "$IMPORT_LINE" | sed 's/[\/&]/\\&/g')/d" "$CLAUDE_MD"
    sed -i '' -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$CLAUDE_MD"
    info "Removed import from $CLAUDE_MD"
  fi
  if [[ -f "$ESPANSO_DIR/dotlang.yml" ]]; then
    rm -f "$ESPANSO_DIR/dotlang.yml"
    info "Removed Espanso snippets"
  fi
  info "DotLang uninstalled."
  exit 0
fi

# Check prerequisites
[[ -d "$HOME/.claude" ]] || error "Claude Code not found (~/.claude/ missing). Install Claude Code first."

# Download function
download() {
  local url="$1" dest="$2"
  if command -v curl &>/dev/null; then
    curl -fsSL "$url" -o "$dest"
  elif command -v wget &>/dev/null; then
    wget -qO "$dest" "$url"
  else
    error "Neither curl nor wget found."
  fi
}

# Install Claude Code ruleset
mkdir -p "$DOTLANG_DIR"
download "$BASE_RAW/CLAUDE.md" "$DOTLANG_DIR/CLAUDE.md"
info "Downloaded DotLang ruleset to $DOTLANG_DIR/CLAUDE.md"

# Add import to CLAUDE.md
if [[ ! -f "$CLAUDE_MD" ]]; then
  echo "$IMPORT_LINE" > "$CLAUDE_MD"
  info "Created $CLAUDE_MD with DotLang import"
elif grep -qF "$IMPORT_LINE" "$CLAUDE_MD"; then
  warn "Import already exists in $CLAUDE_MD — skipping"
else
  printf "\n%s\n" "$IMPORT_LINE" >> "$CLAUDE_MD"
  info "Added import to $CLAUDE_MD"
fi

# Install Espanso snippets (if Espanso is installed)
if [[ -d "$ESPANSO_DIR" ]]; then
  download "$BASE_RAW/espanso/dotlang.yml" "$ESPANSO_DIR/dotlang.yml"
  info "Installed Espanso snippets (:dl for reference)"
else
  warn "Espanso not found — skipping snippets (optional)"
fi

info "Done! DotLang is active in all Claude Code sessions."
info "Espanso: :dl (full ref) | :dl! :dl? :dl# ... (per action) | :dl.m (modifiers) | :dl.p (pipelines)"
info "To uninstall: curl -fsSL $BASE_RAW/install.sh | bash -s -- --uninstall"
