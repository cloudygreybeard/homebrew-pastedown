class Pastedown < Formula
  desc "macOS Pasteboard to Markdown"
  homepage "https://github.com/cloudygreybeard/pastedown"
  url "https://github.com/cloudygreybeard/pastedown/releases/download/v0.2.2/pastedown"
  sha256 "d8856efda4ca3f583e2cc8caffbcc6073b7ee39842460b0e771b22c4ea09a180"
  version "0.2.2"
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
