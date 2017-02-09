class WoogetTestingFramework < Formula
  desc "Make testing of wooget packages easier"
  homepage "https://github.com/wooga/wtf"
  url "https://github.com/wooga/wtf/archive/wooga_wtf-0.2.5.tar.gz"
  sha256 "563000b29f3bced58c46082e7b280289da56a3f2ac2a88a1e1a3e0a28bd23516"

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
