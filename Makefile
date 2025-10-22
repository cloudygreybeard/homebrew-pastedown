# Homebrew Tap Management
# This Makefile helps manage the multi-package Homebrew tap

.PHONY: help install test update-version clean list

# Default target
help:
	@echo "Homebrew Tap Management"
	@echo ""
	@echo "Available targets:"
	@echo "  install     - Install a package from this tap"
	@echo "  test        - Test a formula"
	@echo "  list        - List available packages"
	@echo "  update-version PACKAGE=<package> VERSION=<version> - Update formula for new version"
	@echo "  clean       - Clean up temporary files"
	@echo ""
	@echo "Examples:"
	@echo "  make list"
	@echo "  make install PACKAGE=<package-name>"
	@echo "  make test PACKAGE=<package-name>"
	@echo "  make update-version PACKAGE=<package-name> VERSION=<version>"

# Install a package from this tap
install:
ifndef PACKAGE
	@echo "Error: PACKAGE is required"
	@echo "Usage: make install PACKAGE=<package-name>"
	@echo "Available packages:"
	@$(MAKE) list
	@exit 1
endif
	@if [ ! -f "Formula/$(PACKAGE).rb" ]; then \
		echo "Error: Package '$(PACKAGE)' not found"; \
		echo "Available packages:"; \
		$(MAKE) list; \
		exit 1; \
	fi
	@echo "Installing $(PACKAGE) from cloudygreybeard/tap tap..."
	brew install cloudygreybeard/tap/$(PACKAGE)

# Test a formula
test:
ifndef PACKAGE
	@echo "Error: PACKAGE is required"
	@echo "Usage: make test PACKAGE=<package-name>"
	@echo "Available packages:"
	@$(MAKE) list
	@exit 1
endif
	@if [ ! -f "Formula/$(PACKAGE).rb" ]; then \
		echo "Error: Package '$(PACKAGE)' not found"; \
		echo "Available packages:"; \
		$(MAKE) list; \
		exit 1; \
	fi
	@echo "Testing $(PACKAGE) formula..."
	brew test cloudygreybeard/tap/$(PACKAGE)

# List available packages
list:
	@echo "Available packages in this tap:"
	@for formula in Formula/*.rb; do \
		if [ -f "$$formula" ]; then \
			package=$$(basename "$$formula" .rb); \
			desc=$$(grep -E '^  desc ' "$$formula" | sed 's/^  desc "//' | sed 's/"$$//' || echo "No description"); \
			echo "  $$package - $$desc"; \
		fi; \
	done

# Update formula for new version
update-version:
ifndef PACKAGE
	@echo "Error: PACKAGE is required"
	@echo "Usage: make update-version PACKAGE=<package-name> VERSION=<version>"
	@echo "Available packages:"
	@$(MAKE) list
	@exit 1
endif
ifndef VERSION
	@echo "Error: VERSION is required"
	@echo "Usage: make update-version PACKAGE=<package-name> VERSION=<version>"
	@exit 1
endif
	@if [ ! -f "Formula/$(PACKAGE).rb" ]; then \
		echo "Error: Package '$(PACKAGE)' not found"; \
		echo "Available packages:"; \
		$(MAKE) list; \
		exit 1; \
	fi
	@echo "Updating $(PACKAGE) formula for version $(VERSION)..."
	@./hack/update-formula.sh $(PACKAGE) $(VERSION)

# Clean up temporary files
clean:
	@echo "Cleaning up temporary files..."
	@rm -f /tmp/cloudygreybeard-*
