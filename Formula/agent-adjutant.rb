class AgentAdjutant < Formula
  desc "Task hub for coding agents, as one binary"
  homepage "https://github.com/syarihu/agent-adjutant"
  license "MIT"

  depends_on "gh"
  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.6.0/agent-adjutant-aarch64-apple-darwin.tar.gz"
      sha256 "e70699d4a19066000d00e0495e79e22bc8edecba65acb1070238fb8187d64e65"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.6.0/agent-adjutant-x86_64-apple-darwin.tar.gz"
      sha256 "00743bc3d49b44b0509785b60b0fed37a591b1d5bd4ce38f5de9677623d5c1e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.6.0/agent-adjutant-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3cca1df7400ac9692b7cf03d25e6b1b3fa27164ab9ae01d8ff3f2ca657512777"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.6.0/agent-adjutant-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "662e0ac6167efcf8f13060a0c7c74fe1339b096e9c7babc5909e08d13d3f1b9f"
    end
  end

  def install
    bin.install "adjutant"
    bin.install "adj"
  end

  def caveats
    <<~EOS
      To get started:
        gh auth login
        adjutant install-mcp          # registers the MCP server with Claude Code
                                      # (--target agy for Antigravity, --target json for others)
        adj server start              # starts the board (http://127.0.0.1:4577 by default)
        cd <repository> && adj hub    # the repository appears on the board

      After brew upgrade, run adj server restart so the server runs the new version.
    EOS
  end

  test do
    assert_match "adjutant 0.6.0", shell_output("#{bin}/adjutant --version")
    assert_match "adjutant 0.6.0", shell_output("#{bin}/adj --version")
  end
end
