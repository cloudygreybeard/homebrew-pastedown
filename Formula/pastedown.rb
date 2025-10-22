class Pastedown < Formula
  desc "macOS Pasteboard to Markdown"
  homepage "https://github.com/cloudygreybeard/pastedown"
  url "https://github.com/cloudygreybeard/pastedown/releases/download/v0.1.1/pastedown"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
