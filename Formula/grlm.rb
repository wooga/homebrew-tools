class Grlm < Formula
  desc "Monitor github rate limit of a user "
  homepage "https://github.com/Larusso/github-rate-limit-monitor"
  url "https://github.com/Larusso/github-rate-limit-monitor/archive/v1.2.0.tar.gz"
  sha256 "d26337b777f14291ce4179cc3e9a96cc6fb1f21efd1f5b56fc0a1a9c4c9ea761"
  head "https://github.com/Larusso/github-rate-limit-monitor.git"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
