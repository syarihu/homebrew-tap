class Lk < Formula
  desc "Local knowledge base CLI for Claude Code"
  homepage "https://github.com/syarihu/local-knowledge-cli"
  version "0.9.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-apple-darwin.tar.gz"
      sha256 "8114399f7d7a6a942e01febecc9c53f7d6a22ce179a3004edd3b1570f455b4ef"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-apple-darwin.tar.gz"
      sha256 "6eff70c62158fd6b6cfe7e63028098ad83d21ca947353a6f85d400394a7e956e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1384128d7be1952c9aebeb037b2b8278cc7ebfca9b8b2b2ee79c41cc607f9ca3"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7259ce4e1ea6229cf0ebc27cad746f753f5d73fe8e7cad7a5d7a1b2c88cb5b82"
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
