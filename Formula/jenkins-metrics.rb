class JenkinsMetrics < Formula
  desc "A simple CLI tool to calculate basic Jenkins Job KPI's"
  homepage "https://github.com/wooga/jenkins-metrics"
  head "https://github.com/wooga/jenkins-metrics.git"
  version "0.1.0"

  stable do
    url "https://github.com/wooga/jenkins-metrics/archive/v#{version}.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
