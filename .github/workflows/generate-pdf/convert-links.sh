#!/bin/bash

# Check if the correct number of arguments were provided
if [ $# -lt 2 ]; then
  echo "Usage: $0 <repo-url> <markdown-file>"
  echo "Example: $0 https://github.com/your-username/your-repo/blob/main README.md"
  exit 1
fi

# Assign the first argument as the repo URL and the second as the markdown file
REPO_URL=$1
MARKDOWN_FILE=$2

# Check if the file exists
if [ ! -f "$MARKDOWN_FILE" ]; then
  echo "Error: File '$MARKDOWN_FILE' not found!"
  exit 1
fi

# Find and replace ./ relative links with main branch URLs
sed -i -E "s|\(\./([^)]+)\)|\($REPO_URL/\1\)|g" "$MARKDOWN_FILE"

echo "Updated relative links to absolute URLs in $MARKDOWN_FILE"
