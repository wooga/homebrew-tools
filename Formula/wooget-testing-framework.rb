class WoogetTestingFramework < Formula
  desc "Make testing of wooget packages easier"
  homepage "https://github.com/wooga/wtf"
  head "git@github.com:wooga/wtf.git"
  version "0.2.4"
  
  url "https://github.com/wooga/wtf/archive/wooga_wtf-0.2.4.gem.tar.gz"
  sha256 "43b3cb2db6eda2efccb86f0b2c65e71881bec5b3c06aaa9fb5e1fac821b56346"

  devel do
    url "https://github.com/wooga/wtf/archive/wooga_wtf-0.2.5.tar.gz"
    sha256 "563000b29f3bced58c46082e7b280289da56a3f2ac2a88a1e1a3e0a28bd23516"    

  end

  depends_on "homebrew/fuse/ifuse" => :run
  depends_on :osxfuse => :run

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "wtf.gemspec"
    system "gem", "install", "wooga_wtf-#{version}.gem"

    bin.install libexec/"bin/wtf"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/wtf", "--version"
  end
end
