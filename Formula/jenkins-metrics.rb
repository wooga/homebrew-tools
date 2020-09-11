class JenkinsMetrics < Formula
  desc "A simple CLI tool to calculate basic Jenkins Job KPI's"
  homepage "https://github.com/wooga/jenkins-metrics"
  head "https://github.com/wooga/jenkins-metrics.git"
  version "0.3.0"

  stable do
    url "https://github.com/wooga/jenkins-metrics/archive/v#{version}.tar.gz"
    sha256 "e1d8c53089f7ad45a0840258deeffaeb859573c98b8ab28d4d634645105518df"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
