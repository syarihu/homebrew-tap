class AgentAdjutant < Formula
  desc "Task hub for coding agents, as one binary"
  homepage "https://github.com/syarihu/agent-adjutant"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.4.0/agent-adjutant-aarch64-apple-darwin.tar.gz"
      sha256 "990fd3f0260d90194f085f47a141897f2691612344248339cacd1c63d813d3fb"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.4.0/agent-adjutant-x86_64-apple-darwin.tar.gz"
      sha256 "3d4719841e99ff1f04b27ed212f0436d025747d38c5abbf8bbd6294d989ad458"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.4.0/agent-adjutant-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "091cf454b4a5241871f54bbb855ff2d59819ab927634f253bbabf194fb5b1d9d"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.4.0/agent-adjutant-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b480172745a40e24641fc2410a4a1527f814489ff3c8556570fd1b187830a3a8"
    end
  end

  def install
    bin.install "adjutant"
    bin.install "adj"
  end

  test do
    assert_match "adjutant 0.4.0", shell_output("#{bin}/adjutant --version")
    assert_match "adjutant 0.4.0", shell_output("#{bin}/adj --version")
  end
end
