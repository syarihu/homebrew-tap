class AgentAdjutant < Formula
  desc "Task hub for coding agents, as one binary"
  homepage "https://github.com/syarihu/agent-adjutant"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.3.0/agent-adjutant-aarch64-apple-darwin.tar.gz"
      sha256 "d51e16533831f242108da7d0c7847be44d127ad7a42823ee46b83029da2a38f1"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.3.0/agent-adjutant-x86_64-apple-darwin.tar.gz"
      sha256 "f968c06b73b66162fe87484cc5437d7e116b0f0b8a9808cd872a9fcf61eb18e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.3.0/agent-adjutant-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e1abd27517676da1e0696cb33f222e030aa27cbafa3eefa2e4e8724b7e17666"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.3.0/agent-adjutant-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "647672521355a0f73d089c8ed9b4e60ebc93eeac4ee3567951d4bcf9b5df9dad"
    end
  end

  def install
    bin.install "adjutant"
    bin.install "adj"
  end

  test do
    assert_match "adjutant 0.3.0", shell_output("#{bin}/adjutant --version")
    assert_match "adjutant 0.3.0", shell_output("#{bin}/adj --version")
  end
end
