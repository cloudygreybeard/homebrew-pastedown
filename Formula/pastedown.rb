class Pastedown < Formula
  desc "macOS Pasteboard to Markdown"
  homepage "https://github.com/cloudygreybeard/pastedown"
  url "https://github.com/cloudygreybeard/pastedown/releases/download/v0.1.0/pastedown"
  sha256 "84511755ad3cccde1bdb11d86061cdc937f838566ff5e4e06cf9dc0e617f8b66"
  version "0.1.0"
  license "Apache-2.0"

  depends_on :macos

  def install
    bin.install "pastedown"
  end

  test do
    system "#{bin}/pastedown", "--version"
  end
end
