class Wooget < Formula
  desc "nuget package cli for unity3d"
  homepage "https://github.com/wooga/wooget"
  url "https://github.com/wooga/wooget/archive/wooga_wooget-2.1.0.tar.gz"
  sha256 "b78ccacd2d35e1a072555c4da92c2b3b3fcc86292b6aa9d7dd647624db79da6a"

  depends_on "mono" => :run
  depends_on "paket" => :run
  depends_on "curl" => :build

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "wooget.gemspec"
    system "gem", "install", "wooga_wooget-#{version}.gem"

    bin.install libexec/"bin/wooget"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/wooget"
  end
end

