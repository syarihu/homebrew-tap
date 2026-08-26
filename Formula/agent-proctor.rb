class AgentProctor < Formula
  desc "Watch coding agents in worktrees and see which ones are waiting on you"
  homepage "https://github.com/syarihu/agent-proctor"
  url "https://github.com/syarihu/agent-proctor/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c9fc38b71de51637ca78ebd3c00248832d13298feb31618fed1abc04c355cec8"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "./scripts/build-app.sh", prefix
    libexec.install "scripts/sign-app.sh", "scripts/create-signing-cert.sh"
    libexec.install "Resources/Proctor.entitlements"
    bin.install_symlink prefix/"Agent Proctor.app/Contents/Helpers/proctor"
  end

  def post_install
    system libexec/"sign-app.sh", prefix/"Agent Proctor.app"
  end

  def caveats
    <<~EOS
      To open Agent Proctor from Launchpad, Spotlight, or Raycast:
        ln -s "#{opt_prefix}/Agent Proctor.app" /Applications/

      Agent Proctor requires permission to control iTerm2 via Apple Events.
      If prompted after upgrading, grant permission in System Settings.

      To re-sign the app with a stable local certificate:
        "#{opt_libexec}/sign-app.sh" "#{opt_prefix}/Agent Proctor.app"
    EOS
  end

  test do
    ENV["PROCTOR_STATE_DIR"] = testpath/"state"
    assert_equal [], JSON.parse(shell_output("#{bin}/proctor ls --json --all"))
  end
end
