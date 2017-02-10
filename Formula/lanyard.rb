class Lanyard < Formula
  desc "Helper to work with the OSX keychain"
  homepage "https://github.com/wooga/lanyard"
  url "https://github.com/wooga/lanyard/archive/v0.2.0.tar.gz"
  sha256 "0461ad2d37a0445698af4cc52d9aa50326950f0c55cd4902eadead45377bcc30"

  resource "docopt" do
    url "https://rubygems.org/gems/docopt-0.5.0.gem"
    sha256 "d7e793dc81e68902aae1ed6120550460b12e1fa911da131b4fd482b40e9b084b"
  end

  def install
    ENV["GEM_HOME"] = libexec/"vendor"
    
    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system("gem", "install", r.cached_download, "--no-document")
    end

    inreplace "lanyard.gemspec" do |s|
      s.gsub! '`git ls-files -z`.split("\x0")', 'Dir["{**/}{.*,*}"]'
    end

    system "gem", "build", "lanyard.gemspec"
    system("gem", "install", "lanyard-#{version}.gem", "--ignore-dependencies")

    bin.install libexec/"vendor/bin/lanyard"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/lanyard"
  end
end

