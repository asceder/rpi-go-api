#!/bin/bash

# Abort on any error
set -e

# Default commit message if none provided
COMMIT_MSG=${1:-"🚀 Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"}

echo "🔍 Checking for Git repository..."
if [ ! -d .git ]; then
  echo "❌ This is not a Git repository."
  exit 1
fi

echo "📦 Staging all changes..."
git add .

echo "📝 Committing changes..."
git commit -m "$COMMIT_MSG"

echo "📤 Pushing to origin..."
git push origin "$(git rev-parse --abbrev-ref HEAD)"

echo "✅ All changes pushed!"
