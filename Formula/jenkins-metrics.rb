class JenkinsMetrics < Formula
  desc "A simple CLI tool to calculate basic Jenkins Job KPI's"
  homepage "https://github.com/wooga/jenkins-metrics"
  head "https://github.com/wooga/jenkins-metrics.git"
  version "0.1.0"

  stable do
    url "https://github.com/wooga/jenkins-metrics/archive/v#{version}.tar.gz"
    sha256 "087e63389eaeb5b29c7d54fb257cced13631dddcd1f321c8f72428adcd5623f2"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
