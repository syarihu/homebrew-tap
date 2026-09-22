class Lk < Formula
  desc "Local knowledge base CLI for Claude Code"
  homepage "https://github.com/syarihu/local-knowledge-cli"
  version "0.20.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-apple-darwin.tar.gz"
      sha256 "540e49db642da12bf4b928c551951bc8db20871bc3bd49d3e144904c58fae1bf"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-apple-darwin.tar.gz"
      sha256 "0887af72e203be4165e73e6aa6843acb3c414e39e40da4740da5de8d6fd7a1d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4aa4f7fedd794f0e4ec45e21e05fd0d64c6885c1407e43ab30f64bc16f417e3c"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c62e3e73f0c56936f704c0489b9952c5cd964a47b0a338db771666a917499c1"
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
