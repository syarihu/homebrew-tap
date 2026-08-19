class Calday < Formula
  desc "CLI tool to fetch today's calendar events as JSON"
  homepage "https://github.com/syarihu/calday"
  url "https://github.com/syarihu/calday/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "47c788ed2c5a77a7b243cb27d26fdb5b4ca8a2be5dcf4a634c15ff3255cddba3"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/calday"
  end
end
