#!/bin/bash
# Update Homebrew formula for a package release
# Usage: ./hack/update-formula.sh <package> <version>

set -e

if [ $# -ne 2 ]; then
    echo "Usage: $0 <package> <version>"
    echo "Example: $0 pastedown 0.2.0"
    exit 1
fi

PACKAGE="$1"
VERSION="$2"
FORMULA_FILE="Formula/${PACKAGE}.rb"

# Validate package exists
if [ ! -f "$FORMULA_FILE" ]; then
    echo "Error: Formula file $FORMULA_FILE not found"
    echo "Available packages:"
    ls -1 Formula/*.rb | sed 's/Formula\///' | sed 's/\.rb$//'
    exit 1
fi

echo "Updating $PACKAGE formula to version $VERSION..."

# Download the new binary to get SHA256
echo "Downloading binary for version $VERSION..."
curl -L "https://github.com/cloudygreybeard/$PACKAGE/releases/download/v$VERSION/$PACKAGE" -o "/tmp/cloudygreybeard-$PACKAGE-$VERSION"

# Calculate SHA256
NEW_SHA256=$(shasum -a 256 "/tmp/cloudygreybeard-$PACKAGE-$VERSION" | cut -d' ' -f1)
echo "SHA256: $NEW_SHA256"

# Update the formula
echo "Updating formula file..."
sed -i '' "s/version \".*\"/version \"$VERSION\"/" "$FORMULA_FILE"
sed -i '' "s|url \".*\"|url \"https://github.com/cloudygreybeard/$PACKAGE/releases/download/v$VERSION/$PACKAGE\"|" "$FORMULA_FILE"
sed -i '' "s/sha256 \".*\"/sha256 \"$NEW_SHA256\"/" "$FORMULA_FILE"

echo "Formula updated successfully!"
echo ""
echo "Next steps:"
echo "1. Test the formula: make test PACKAGE=$PACKAGE"
echo "2. Commit changes: git add $FORMULA_FILE"
echo "3. Commit: git commit -m \"Update $PACKAGE to v$VERSION\""
echo "4. Push: git push origin main"

# Clean up
rm -f "/tmp/cloudygreybeard-$PACKAGE-$VERSION"
