class JenkinsPluginsToGradle < Formula
  desc "Jenkins plugin list to gradle dependency list"
  homepage "https://github.com/wooga/jenkins-plugins-to-gradle"

  head "https://github.com/wooga/jenkins-plugins-to-gradle.git"

  stable do
    url "https://github.com/wooga/jenkins-plugins-to-gradle/archive/1.0.0.tar.gz"
    sha256 "e3455864bd1fc53c1bb9d64110ed60a122f65a7d91c757f18b717c0e2a64a234"
  end

  resource "docopt" do
    url "https://rubygems.org/gems/docopt-0.5.0.gem"
    sha256 "d7e793dc81e68902aae1ed6120550460b12e1fa911da131b4fd482b40e9b084b"
  end

  def install
    ENV["GEM_HOME"] = libexec/"vendor"

    inreplace (buildpath/"lib/jenkins/utils/version.rb"), /"([\da-z\.]+)"/, '"\1-HEAD"' if build.head?
    inreplace (buildpath/"jenkins-plugins-to-gradle.gemspec"), '`git ls-files -z`.split("\x0")', 'Dir["{**/}{.*,*}"]'

    cp buildpath/"exe/jengra", buildpath/"exe/jenkins-plugins-to-gradle"

    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system "gem", "install", r.cached_download, "--no-document"
    end

    system "gem", "build", "jenkins-plugins-to-gradle.gemspec"
    system "gem", "install", Dir["jenkins_plugins_to_gradle-*.gem"].first

    bin.install libexec/"vendor/bin/jengra"
    bin.install libexec/"vendor/bin/jenkins-plugins-to-gradle"

    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/jengra"
  end
end
