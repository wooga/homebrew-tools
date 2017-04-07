class UnityVersionManager < Formula
  desc "Tool that just manipulates a link to the current unity version"
  homepage "https://github.com/wooga/unity-version-manager"
  head "https://github.com/wooga/unity-version-manager.git"
  
  stable do
    url "https://github.com/wooga/unity-version-manager/archive/wooga_uvm-0.3.1.tar.gz"
    sha256 "288d88a13e801f3fa71491381c8933b81f20ca56efe769b4ffcfcb972dc0404b"
  end

  resource "tzinfo" do
    url "https://rubygems.org/gems/tzinfo-1.2.3.gem"
    sha256 "9469862963cf5e8f12bb7d1cf89e681ebfee417537f6835b2e471c7c260d2817"
  end

  resource "addressable" do
    url "https://rubygems.org/gems/addressable-2.5.1.gem"
    sha256 "b09603b313a94fa3674d8fbaae77cc7c778e9d3cde5fea3b7c1fe447941818c5"
  end

  resource "byebug" do
    url "https://rubygems.org/gems/byebug-9.0.6.gem"
    sha256 "60b508d685ecbdd0ce4c8508527e893b27b4461a347564c589b0bd5c8c656ecd"
  end

  resource "faraday" do
    url "https://rubygems.org/gems/faraday-0.12.0.1.gem"
    sha256 "a80da46d8f4d64d011f97768894e33d3aaee25a37b8742d6197f2416857db849"
  end

  resource "octokit" do
    url "https://rubygems.org/gems/octokit-4.7.0.gem"
    sha256 "e4058c3142ff42a864fe2a5a5001338d367ca3527768ce9fd4fe7810d7a9cc40"
  end

  resource "pry-byebug" do
    url "https://rubygems.org/gems/pry-byebug-3.4.2.gem"
    sha256 "58f604526b36348aec680978172262cd5ca8767fb1dae9fa39611d2c37629853"
  end

  def install
    ENV["GEM_HOME"] = libexec/"vendor"

    inreplace (buildpath/"lib/uvm/version.rb"), /"([\da-z\.]+)"/, '"\1-HEAD"' if build.head?

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
