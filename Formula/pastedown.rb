class Pastedown < Formula
  desc "macOS Pasteboard to Markdown"
  homepage "https://github.com/cloudygreybeard/pastedown"
  url "https://github.com/cloudygreybeard/pastedown/releases/download/v0.1.3/pastedown"
  sha256 "8bcfb3738629bc888be1da983a6422bf0321b587759b6267e1a3b981697e151c"
  version "0.1.3"
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
