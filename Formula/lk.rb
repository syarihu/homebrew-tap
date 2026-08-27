class Lk < Formula
  desc "Local knowledge base CLI for Claude Code"
  homepage "https://github.com/syarihu/local-knowledge-cli"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-apple-darwin.tar.gz"
      sha256 "bdfe5b8251cb93173ac1673e5d8d750f8f71bf0db354870666335ec04fcfed78"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-apple-darwin.tar.gz"
      sha256 "1d0f2c119063022833b882a330f7dfef399f8ba7d8a00a475a91a489346ed733"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5c579a16a27d70348bbd545c807b49a4ad8c86135bf8216b80966aab847ca21"
    else
      url "https://github.com/syarihu/local-knowledge-cli/releases/download/v#{version}/lk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8bedbc4707991a2983a5c2ba5d69d9762a3babca8cc04fb19d2a772451d624b0"
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
