class AgentAdjutant < Formula
  desc "Task hub for coding agents, as one binary"
  homepage "https://github.com/syarihu/agent-adjutant"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.1.1/agent-adjutant-aarch64-apple-darwin.tar.gz"
      sha256 "30fe8f023c8f8f1b3db38d7a418b9fe4250f5bd5833d6f808b3cfb8cdd08938c"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.1.1/agent-adjutant-x86_64-apple-darwin.tar.gz"
      sha256 "814b20d393beb6c8495d27f619a87a8ba3da4ca8fae329b8ac9d448acb9eab4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.1.1/agent-adjutant-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "416adb4396862bddb533e1d1f8f9ed293ecaeeeff6ad99afbf846e7458b7a730"
    else
      url "https://github.com/syarihu/agent-adjutant/releases/download/v0.1.1/agent-adjutant-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03eaeebc11ad55cb40565d7dc701a30ffc53a0609cb68644b87b9ddd402ac500"
    end
  end

  def install
    bin.install "adjutant"
    bin.install "adj"
  end

  test do
    assert_match "adjutant 0.1.1", shell_output("#{bin}/adjutant --version")
    assert_match "adjutant 0.1.1", shell_output("#{bin}/adj --version")
  end
end
