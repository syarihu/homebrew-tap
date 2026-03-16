class Lk < Formula
  desc "Local knowledge base CLI for Claude Code"
  homepage "https://github.com/syarihu/local-knowledge-cli"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-apple-darwin.tar.gz"
      sha256 "02a41033036feffe0545d68b9c4398b8f73fc543965896dfcc2bb9fd172e83a1"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-apple-darwin.tar.gz"
      sha256 "2d1ad083e43543888b72233313b3cd4bd495f29f5d694cafedeec4f06d72c9f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d3e2f8217ec725b618d008d2a1dccb2e18818bc52f5049732bc99ba744cb289"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27e52953a1b01089aaa725cc9dba7acca71c6c5a5dbd508ce9132ccdaef96a47"
    end
  end

  def install
    bin.install "lk"
  end

  def post_install
    system bin/"lk", "install-commands"
  end

  test do
    assert_match "lk #{version}", shell_output("#{bin}/lk --version")
  end
end
