class Wooget < Formula
  desc "nuget package cli for unity3d"
  homepage "https://github.com/wooga/wooget"
  url "https://github.com/wooga/wooget/archive/wooga_wooget-2.1.0.gem.tar.gz"
  sha256 "4ae646bff1a0f1d8e39cd45fc6bb39a88a146fd44efcd5230bf52a724f9fa34e"

  depends_on "mono" => :run
  depends_on "paket" => :run

  def install
    system "gem", "build", "wooget.gemspec"
    system "gem", "install", "wooga_wooget-#{version}.gem"
  end
end
