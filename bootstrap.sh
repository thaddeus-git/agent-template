#!/usr/bin/env bash
# bootstrap.sh — one-time setup for a project forked from agent-template.
#
# Run this once after cloning. It pulls the playbook submodule and
# installs npm dependencies. After this, run `claude` to start a
# Claude Code session and `npm run arch:preview` to view the diagram.

set -euo pipefail

# --- Sanity checks ---

if ! command -v git >/dev/null 2>&1; then
  echo "❌ git is not installed. Install git first, then re-run."
  exit 1
fi

if ! [ -d .git ]; then
  echo "❌ This doesn't look like a git repository. Run inside a project root."
  exit 1
fi

# --- Submodules (playbook lives here) ---

if [ -f .gitmodules ]; then
  echo "→ Pulling submodules (playbook)..."
  git submodule update --init --recursive
else
  echo "ℹ No .gitmodules found; skipping submodule init."
  echo "  If you want the agent-playbook submodule, run:"
  echo "    git submodule add git@github.com:thaddeus-git/agent-playbook.git docs/playbook"
fi

# --- npm install (for likec4) ---

if [ -f package.json ]; then
  if ! command -v npm >/dev/null 2>&1; then
    echo "⚠ package.json exists but npm is not installed."
    echo "  Install Node.js v20+ from https://nodejs.org, then re-run this script."
    exit 1
  fi
  echo "→ Installing npm dependencies (this may take a minute)..."
  npm install
else
  echo "ℹ No package.json found; skipping npm install."
fi

# --- Done ---

echo ""
echo "✅ Setup complete."
echo ""
echo "Next steps:"
echo "  1. Read QUICKSTART.md (1 page) for the daily workflow."
echo "  2. Run 'claude' to start a Claude Code session."
if [ -f package.json ]; then
  echo "  3. Run 'npm run arch:preview' to view the architecture diagram."
fi
