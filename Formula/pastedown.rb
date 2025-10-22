class Pastedown < Formula
  desc "macOS Pasteboard to Markdown"
  homepage "https://github.com/cloudygreybeard/pastedown"
  url "https://github.com/cloudygreybeard/pastedown/releases/download/v0.1.1/pastedown"
  sha256 "cce67a5f1a6c6be7e2ee03b474e6a1fb46c89b1121d4b5580b5f999ce052eb97"
  version "0.1.1"
  license "Apache-2.0"

  depends_on :macos

  # This is a universal binary that works on both Intel and Apple Silicon
  on_intel do
    # Intel Mac support
  end

  on_arm do
    # Apple Silicon support
  end

  def install
    bin.install "pastedown"
  end

  test do
    system "#{bin}/pastedown", "--version"
  end
end
