class Lk < Formula
  desc "Local knowledge base CLI for Claude Code"
  homepage "https://github.com/syarihu/local-knowledge-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-apple-darwin.tar.gz"
      sha256 "684434863e74c3d1101f9e743eb659513954f8769892f0b844c02409c734e4be"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-apple-darwin.tar.gz"
      sha256 "30a1a7aff79ff08f17fe809bfaea697dbbf545d664267a7cc302b42d0d874f63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "caa241c7f7e533a1cd9ca8b9f272923dc021bb89350085a046f2d2fc80648b6f"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8e5d5f7769004ffa48b7f620453bd5df4a7642b59506f03f290af59fd2f6385"
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
