# homebrew-tap

Homebrew tap for cloudygreybeard tools.

## Available Tools

### pastedown
macOS Pasteboard to Markdown converter. Converts formatted text from the macOS pasteboard to Markdown format while preserving formatting, links, lists, and other structural elements.

**Installation:**
```bash
brew install cloudygreybeard/tap/pastedown
```

**Documentation:** [cloudygreybeard/pastedown](https://github.com/cloudygreybeard/pastedown)

## Installation

Install any tool directly (Homebrew automatically taps the repository):

```bash
# Install pastedown
brew install cloudygreybeard/tap/pastedown

# Future tools will be available as:
# brew install cloudygreybeard/tap/tool-name
```

Or manually add the tap first (optional):

```bash
brew tap cloudygreybeard/tap
```

## Development

### Updating the Formula

When a new version of pastedown is released, update the formula:

```bash
# Update to a new version
make update-version VERSION=0.2.0

# Or use the script directly
./hack/update-formula.sh 0.2.0

# Test the updated formula
make test

# Commit and push changes
git add Formula/pastedown.rb
git commit -m "Update pastedown to v0.2.0"
git push origin main
```

### Available Make Targets

```bash
make help          # Show this help
make install       # Install pastedown from this tap
make test          # Test the formula
make update-version VERSION=<version>  # Update formula for new version
make clean         # Clean up temporary files
```

### Formula Management

The formula is located in `Formula/pastedown.rb` and contains:

- **Description**: Tool description and homepage
- **URL**: Download URL for the binary
- **SHA256**: Checksum for integrity verification
- **Version**: Release version
- **Dependencies**: macOS requirement
- **Installation**: Binary installation to `/opt/homebrew/bin`
- **Test**: Version check test

### Release Process

1. **New Release**: A new pastedown release is created in the main repository
2. **Update Formula**: Use `make update-version VERSION=x.y.z` to update
3. **Test**: Run `make test` to verify the formula works
4. **Commit**: Commit and push the updated formula
5. **Verify**: Users can now install the new version with `brew install`

## Troubleshooting

### Installation Issues

If installation fails:

```bash
# Update the tap
brew untap cloudygreybeard/tap
brew tap cloudygreybeard/tap

# Try installing again
brew install cloudygreybeard/tap/pastedown
```

### Formula Issues

If the formula has issues:

```bash
# Check formula syntax
brew audit cloudygreybeard/tap/pastedown

# Test the formula
brew test cloudygreybeard/tap/pastedown
```

## Links

- **Main Repository**: [cloudygreybeard/pastedown](https://github.com/cloudygreybeard/pastedown)
- **Releases**: [GitHub Releases](https://github.com/cloudygreybeard/pastedown/releases)
- **Documentation**: [Main README](https://github.com/cloudygreybeard/pastedown#readme)