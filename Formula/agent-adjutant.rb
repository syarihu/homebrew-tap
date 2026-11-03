class AgentAdjutant < Formula
  desc "Task hub for coding agents, as one binary"
  homepage "https://github.com/syarihu/agent-adjutant"
  license "MIT"

  depends_on "gh"
  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.5.0/agent-adjutant-aarch64-apple-darwin.tar.gz"
      sha256 "1646c55eedd7ed085f822363f760f44b7af3986a7bfec4b37a3ce87cca6a99c7"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.5.0/agent-adjutant-x86_64-apple-darwin.tar.gz"
      sha256 "c4ad9308022ad7fda0175b0e85fa148e292ddeb4d251c30aa095b0ce0ea4680c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.5.0/agent-adjutant-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86b8daa62eb894451dc3420056376f25a267604cece5a86d5e4fc84870121c4d"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.5.0/agent-adjutant-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b812e43a7b8f35783ecd94661e5106d20e43278cc34f529cec4852efe417d47"
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
    assert_match "adjutant 0.5.0", shell_output("#{bin}/adjutant --version")
    assert_match "adjutant 0.5.0", shell_output("#{bin}/adj --version")
  end
end
