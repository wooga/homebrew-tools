class Grlm < Formula
  desc "Monitor github rate limit of a user "
  homepage "https://github.com/Larusso/github-rate-limit-monitor"
  head "https://github.com/Larusso/github-rate-limit-monitor.git"

  stable do
    url "https://github.com/Larusso/github-rate-limit-monitor/archive/v1.0.0.tar.gz"
    sha256 "f064aff6e9f28dd0e4543a44a88b6f8387a5da28cf5cd93e32396988f175de23"
  end

  resource "octokit" do
    url "https://rubygems.org/gems/octokit-4.8.0.gem"
    sha256 "af056933e09c0e5fb2648c5837c4fb4a9e255e88448c2595b39cf55bb73ee7c2"
  end

  resource "docopt" do
    url "https://rubygems.org/gems/docopt-0.5.0.gem"
    sha256 "d7e793dc81e68902aae1ed6120550460b12e1fa911da131b4fd482b40e9b084b"
  end

  resource "ruby-progressbar" do
    url "https://rubygems.org/gems/ruby-progressbar-1.8.1.gem"
    sha256 "95ded755295440de814704970d7ccaf3cb259854534f03a03a6d05918f3eece3"
  end

  def install
    ENV["GEM_HOME"] = libexec/"vendor"

    inreplace (buildpath/"lib/grlm/version.rb"), /"([\da-z\.]+)"/, '"\1-HEAD"' if build.head?
    inreplace (buildpath/"grlm.gemspec"), '`git ls-files -z`.split("\x0")', 'Dir["{**/}{.*,*}"]'

    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system "gem", "install", r.cached_download, "--no-document"
    end

    system "gem", "build", "grlm.gemspec"
    system "gem", "install", Dir["grlm-*.gem"].first

    bin.install libexec/"vendor/bin/grlm"

    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/grlm"
  end
end
