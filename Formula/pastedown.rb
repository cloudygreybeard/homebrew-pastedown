class Pastedown < Formula
  desc "macOS Pasteboard to Markdown"
  homepage "https://github.com/cloudygreybeard/pastedown"
  url "https://github.com/cloudygreybeard/pastedown/releases/download/v0.3.0/pastedown"
  sha256 "fc217155ecc1c3e7ba8059c3424c3342d975166f480a61d34bfbf25ccfffff1f"
  version "0.3.0"
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
