class AgentAdjutant < Formula
  desc "Task hub for coding agents, as one binary"
  homepage "https://github.com/syarihu/agent-adjutant"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.1.0/agent-adjutant-aarch64-apple-darwin.tar.gz"
      sha256 "6edc97bdfdf130b504bfc718e73ab862cb559126dc5bc626729a010d5e474470"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.1.0/agent-adjutant-x86_64-apple-darwin.tar.gz"
      sha256 "d719a925d4ef2368c0e8c61c746ccb93e2167c1e5fcf5636245c6aa32af7cc56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.1.0/agent-adjutant-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1829dcb78fc3b3d69252c766f9df0b5c14de46ec1f0ec41b62ffa6f1045051f7"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.1.0/agent-adjutant-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08390b7a68a1152d025f29100944d43b9c3cb749bb0545bb7256c2df14b9c2da"
    end
  end

  def install
    bin.install "adjutant"
    bin.install "adj"
  end

  test do
    assert_match "adjutant 0.1.0", shell_output("#{bin}/adjutant --version")
    assert_match "adjutant 0.1.0", shell_output("#{bin}/adj --version")
  end
end
