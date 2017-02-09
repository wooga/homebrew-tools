class Wooget < Formula
  desc "nuget package cli for unity3d"
  homepage "https://github.com/wooga/wooget"
  url "https://github.com/wooga/wooget/archive/wooga_wooget-2.1.1.tar.gz"
  sha256 "f4cce484129caca3b425f7c0c17d23ebcb7f5b61cf10bfd78ae75181024b696a"

  depends_on "mono" => :run
  depends_on "paket" => :run

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "wooget.gemspec"
    system "gem", "install", "-n", ".", "wooga_wooget-#{version}.gem"

    bin.install libexec/"bin/wooget"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/wooget", "--version"
  end
end

