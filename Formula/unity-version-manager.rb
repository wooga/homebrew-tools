class UnityVersionManager < Formula
  desc "Tool that just manipulates a link to the current unity version"
  homepage "https://github.com/wooga/unity-version-manager"
  head "https://github.com/wooga/unity-version-manager.git"
  
  stable do
    url "https://github.com/wooga/unity-version-manager/archive/1.1.0.tar.gz"
    sha256 "fdc40e9888c5600b877d79b32ebc3efff1914949edf8b0419ae4555c36fb6e04"
  end

  devel do
    version "1.2.0"
    url "https://github.com/wooga/unity-version-manager/archive/1.2.0-devel2.zip"
    sha256 "971f1b950e16713c413877b6cd2f4a280d6e6852a39fab69f2f14054a024d05d"
  end

  resource "docopt" do
    url "https://rubygems.org/gems/docopt-0.5.0.gem"
    sha256 "d7e793dc81e68902aae1ed6120550460b12e1fa911da131b4fd482b40e9b084b"
  end

  resource "plist" do
    url "https://rubygems.org/gems/plist-3.2.0.gem"
    sha256 "0b3dd455bde18ba7b954ff2fea4eae733f3b38b71504e723255bccc6567a70a9"
  end

  def install
    ENV["GEM_HOME"] = libexec/"vendor"

    inreplace (buildpath/"lib/uvm/version.rb"), /"([\da-z\.]+)"/, '"\1-HEAD"' if build.head?
    inreplace (buildpath/"uvm.gemspec"), '`git ls-files -z`.split("\x0")', 'Dir["{**/}{.*,*}"]'

    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system "gem", "install", r.cached_download, "--no-document"
    end

    system "gem", "build", "uvm.gemspec"
    system "gem", "install", Dir["wooga_uvm-*.gem"].first

    bin.install libexec/"vendor/bin/uvm"

    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/uvm"
  end
end
