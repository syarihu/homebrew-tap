class AgentAdjutant < Formula
  desc "Task hub for coding agents, as one binary"
  homepage "https://github.com/syarihu/agent-adjutant"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.2.0/agent-adjutant-aarch64-apple-darwin.tar.gz"
      sha256 "27c7faa3afd842ed48bcaf1d240f3ac204df536192d1767bf2c948315e80b1d0"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.2.0/agent-adjutant-x86_64-apple-darwin.tar.gz"
      sha256 "f8af79a3371869748560c884fb9327885271b5e30aaaa71bf89a8914c770ef8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.2.0/agent-adjutant-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af7aa96dae0f66244d129c72179a94fbaf1a4fdaf4787b48d4edfaa35a6dc453"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.2.0/agent-adjutant-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08b356256280caa2fcee3760a11935182d2ed69f77a7483db22daeeed1f3fa50"
    end
  end

  def install
    bin.install "adjutant"
    bin.install "adj"
  end

  test do
    assert_match "adjutant 0.2.0", shell_output("#{bin}/adjutant --version")
    assert_match "adjutant 0.2.0", shell_output("#{bin}/adj --version")
  end
end
