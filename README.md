# homebrew-tap

Multi-package Homebrew tap for cloudygreybeard packages.

## Installation

Install any package directly (Homebrew automatically taps the repository):

```bash
# Install a package
brew install cloudygreybeard/tap/<package-name>

# Examples:
# brew install cloudygreybeard/tap/pastedown
# brew install cloudygreybeard/tap/other-package
```

Or manually add the tap first (optional):

```bash
brew tap cloudygreybeard/tap
```

## Available Packages

To see all available packages:

```bash
make list
```

Example output:
```
Available packages in this tap:
  pastedown (v0.2.2) - macOS Pasteboard to Markdown converter
```

Or check the [Formula directory](Formula/) for available packages.

## Development

### Tap Management

This tap includes comprehensive tooling for managing packages:

```bash
# List all available packages
make list

# Show detailed package information
make show-package PACKAGE=pastedown

# Test a package
make test PACKAGE=pastedown

# Update a package to new version
make update-version PACKAGE=pastedown VERSION=0.2.3

# Validate a formula
make validate-package PACKAGE=pastedown
```

### Package Lifecycle Management

```bash
# Add a new package
make add-package PACKAGE=newpackage REPO=cloudygreybeard/newpackage

# Remove a package
make remove-package PACKAGE=oldpackage

# Show all available commands
make help
```

### Formula Structure

Each package has a formula in `Formula/<package>.rb` containing:

- **Description**: Package description and homepage
- **URL**: Download URL for the binary
- **SHA256**: Checksum for integrity verification
- **Version**: Release version
- **Dependencies**: System requirements
- **Installation**: Binary installation instructions
- **Test**: Package validation tests

### Release Process

1. **New Release**: A new package release is created in the main repository
2. **Update Formula**: Use `make update-version PACKAGE=pastedown VERSION=0.2.3`
3. **Test**: Run `make test PACKAGE=pastedown` to verify the formula works
4. **Commit**: Commit and push the updated formula
5. **Verify**: Users can now install the new version with `brew install cloudygreybeard/tap/pastedown`

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

If a formula has issues:

```bash
# Check formula syntax
brew audit cloudygreybeard/tap/pastedown

# Test the formula
brew test cloudygreybeard/tap/pastedown

# Or use the tap management commands
make validate-package PACKAGE=pastedown
```

## Repository

- **Tap Repository**: [cloudygreybeard/homebrew-tap](https://github.com/cloudygreybeard/homebrew-tap)
- **Formula Directory**: [Formula/](Formula/)