class WoogetTestingFramework < Formula
  desc "Make testing of wooget packages easier"
  homepage "https://github.com/wooga/wtf"
  url "https://github.com/wooga/wtf/archive/wooga_wtf-0.2.5.tar.gz"
  sha256 "1c90126c1a26b55c9f56b0e53d1dca80776f9aae896bcdc316daa7680f16cad2"

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
