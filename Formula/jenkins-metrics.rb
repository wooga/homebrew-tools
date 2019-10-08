class JenkinsMetrics < Formula
  desc "A simple CLI tool to calculate basic Jenkins Job KPI's"
  homepage "https://github.com/wooga/jenkins-metrics"
  head "https://github.com/wooga/jenkins-metrics.git"
  version "0.2.0"

  stable do
    url "https://github.com/wooga/jenkins-metrics/archive/v#{version}.tar.gz"
    sha256 "3a45163390d94d4908997a3d636fa8a6ad96268b1561cfffc9119fac67678859"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
