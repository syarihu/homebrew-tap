class Calday < Formula
  desc "CLI tool to fetch today's calendar events as JSON"
  homepage "https://github.com/syarihu/calday"
  url "https://github.com/syarihu/calday/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6d004c2951822a209b38383fe7a3abc0ca3fc2646a282b0c7160cfc1eb04a2bd"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/calday"
  end
end
