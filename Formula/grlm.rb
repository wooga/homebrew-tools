class Grlm < Formula
  desc "Monitor github rate limit of a user "
  homepage "https://github.com/Larusso/github-rate-limit-monitor"
  url "https://github.com/Larusso/github-rate-limit-monitor/archive/v1.1.0.tar.gz"
  sha256 "51a726e9f644be9d5759099cdb48a81627df4fa57916bfeb2c45a9d928eb836a"
  head "https://github.com/Larusso/github-rate-limit-monitor.git"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
