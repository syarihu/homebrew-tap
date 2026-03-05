class Calday < Formula
  desc "CLI tool to fetch today's calendar events as JSON"
  homepage "https://github.com/syarihu/calday"
  url "https://github.com/syarihu/calday/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7c3c597271e2ede35ad91142fbdfc735ebafc399e13c90a094d21873786063f4"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/calday"
  end
end
