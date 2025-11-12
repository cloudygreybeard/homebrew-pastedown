class Littlesocks < Formula
  desc "SOCKS5 proxy server"
  homepage "https://github.com/cloudygreybeard/littlesocks"
  version "0.1.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/cloudygreybeard/littlesocks/releases/download/v0.1.0/littlesocks_0.1.0_darwin_arm64.tar.gz"
    sha256 "1bee8ba79c0747386503d5d90cb1705e9ca0cae0f265692c924988769107ca5c"
  else
    url "https://github.com/cloudygreybeard/littlesocks/releases/download/v0.1.0/littlesocks_0.1.0_darwin_amd64.tar.gz"
    sha256 "d892332705fd1923de1a324d8c2b22616c33845adb7dcb5d7ce9ca96b864686a"
  end

  def install
    bin.install "littlesocks"
  end

  test do
    system "#{bin}/littlesocks", "-version"
  end
end
