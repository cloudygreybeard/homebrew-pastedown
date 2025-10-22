#!/bin/bash
# Update Homebrew formula for new pastedown release
# Usage: ./scripts/update-formula.sh <version>

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 0.2.0"
    exit 1
fi

VERSION="$1"
FORMULA_FILE="Formula/pastedown.rb"

echo "Updating pastedown formula to version $VERSION..."

# Download the new binary to get SHA256
echo "Downloading binary for version $VERSION..."
curl -L "https://github.com/cloudygreybeard/pastedown/releases/download/v$VERSION/pastedown" -o "/tmp/pastedown-$VERSION"

# Calculate SHA256
NEW_SHA256=$(shasum -a 256 "/tmp/pastedown-$VERSION" | cut -d' ' -f1)
echo "SHA256: $NEW_SHA256"

# Update the formula
echo "Updating formula file..."
sed -i '' "s/version \".*\"/version \"$VERSION\"/" "$FORMULA_FILE"
sed -i '' "s|url \".*\"|url \"https://github.com/cloudygreybeard/pastedown/releases/download/v$VERSION/pastedown\"|" "$FORMULA_FILE"
sed -i '' "s/sha256 \".*\"/sha256 \"$NEW_SHA256\"/" "$FORMULA_FILE"

echo "Formula updated successfully!"
echo ""
echo "Next steps:"
echo "1. Test the formula: make test"
echo "2. Commit changes: git add Formula/pastedown.rb"
echo "3. Commit: git commit -m \"Update pastedown to v$VERSION\""
echo "4. Push: git push origin main"

# Clean up
rm -f "/tmp/pastedown-$VERSION"
