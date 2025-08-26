#!/bin/bash
# deploy.sh - Auto commit, pull, push, and restart Apache for Cloritus CMFS site

# Use custom commit message if provided, otherwise fallback
COMMIT_MSG=${1:-"Auto-deploy: update site and documents"}

echo "🔄 Staging all changes..."
git add -A

echo "📝 Committing changes..."
git commit -m "$COMMIT_MSG" || echo "⚠️ Nothing to commit."

echo "⬇️ Pulling latest changes from remote..."
git pull origin main --rebase

echo "⬆️ Pushing changes to GitHub..."
git push origin main

echo "🔁 Restarting Apache..."
sudo systemctl restart httpd

echo "✅ Deployment complete!"
