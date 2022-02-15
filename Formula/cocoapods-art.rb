class CocoapodsArt < Formula
  desc "Dependency manager for Cocoa projects with jfrog art plugin included"
  homepage "https://cocoapods.org/"
  url "https://github.com/CocoaPods/CocoaPods/archive/1.11.2.tar.gz"
  sha256 "c1f7454a93e334484cc15ec8a88ded4080bf5e39df2b0dff729a2e77044dc3df"
  license "MIT"
  revision 1
  conflicts_with "cocoapods"
  resource "cocoapods-art" do
  	url "https://rubygems.org/gems/cocoapods-art-1.1.0.gem"
  	sha256 "b28f89c9be6269963524aa92ecfbc375ebd388f86475fd7519da196ee86b24fa"
  end

  bottle do
    rebuild 1
    sha256 big_sur: "4be971005bbd070101ffcacac7d8b1c5cca642629b5a043140bf74029def0ab1"
  end

  depends_on "pkg-config" => :build
  depends_on "ruby" if Hardware::CPU.arm?
  
  uses_from_macos "libffi", since: :catalina
  uses_from_macos "ruby", since: :catalina
       
  def install
    if MacOS.version >= :mojave && MacOS::CLT.installed?
      ENV["SDKROOT"] = ENV["HOMEBREW_SDKROOT"] = MacOS::CLT.sdk_path(MacOS.version)
    end
       
    ENV["GEM_HOME"] = libexec
    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system("gem", "install", r.cached_download, "--no-document")
    end

    system "gem", "build", "cocoapods.gemspec"
    system "gem", "install", "cocoapods-#{version}.gem"
    # Other executables don't work currently.
    bin.install libexec/"bin/pod", libexec/"bin/xcodeproj"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end
       
  test do
    system "#{bin}/pod", "list"
  end
end
      
      
