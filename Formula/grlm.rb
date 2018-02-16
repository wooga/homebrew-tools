class Grlm < Formula
  desc "Monitor github rate limit of a user "
  homepage "https://github.com/Larusso/github-rate-limit-monitor"
  head "https://github.com/Larusso/github-rate-limit-monitor.git"

  stable do
    url "https://github.com/Larusso/github-rate-limit-monitor/archive/v1.0.0.tar.gz"
    sha256 "f064aff6e9f28dd0e4543a44a88b6f8387a5da28cf5cd93e32396988f175de23"
  end

  resource "octokit" do
    url "https://rubygems.org/gems/octokit-4.3.0.gem"
    sha256 "d71ed1ec090ee60d3ae79095b15f4055f46361fcdad3f5f3c87b800f263b04c3"
  end

  resource "docopt" do
    url "https://rubygems.org/gems/docopt-0.6.1.gem"
    sha256 "73f837ed376d015971712c17f7aafa021998b964b77d52997dcaff79d6727467"
  end

  resource "ruby-progressbar" do
    url "https://rubygems.org/gems/ruby-progressbar-1.9.0.gem"
    sha256 "d32d1b046400e58007e7043e3b07c9e2c32a248964a55afc780516b7630ff0c5"
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
