# Homebrew Tap Management for pastedown
# This Makefile helps manage the Homebrew tap for pastedown

.PHONY: help install test update-version clean

# Default target
help:
	@echo "Homebrew Tap Management for pastedown"
	@echo ""
	@echo "Available targets:"
	@echo "  install     - Install pastedown from this tap"
	@echo "  test        - Test the formula"
	@echo "  update-version VERSION=<version> - Update formula for new version"
	@echo "  clean       - Clean up temporary files"
	@echo ""
	@echo "Examples:"
	@echo "  make install"
	@echo "  make test"
	@echo "  make update-version VERSION=0.2.0"

# Install pastedown from this tap
install:
	@echo "Installing pastedown from cloudygreybeard/pastedown tap..."
	brew install cloudygreybeard/pastedown/pastedown

# Test the formula
test:
	@echo "Testing pastedown formula..."
	brew test cloudygreybeard/pastedown/pastedown

# Update formula for new version
update-version:
ifndef VERSION
	@echo "Error: VERSION is required"
	@echo "Usage: make update-version VERSION=0.2.0"
	@exit 1
endif
	@echo "Updating formula for version $(VERSION)..."
	@./hack/update-formula.sh $(VERSION)

# Clean up temporary files
clean:
	@echo "Cleaning up temporary files..."
	@rm -f /tmp/pastedown-*
