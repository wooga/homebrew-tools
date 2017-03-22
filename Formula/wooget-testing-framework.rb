class WoogetTestingFramework < Formula
  desc "Make testing of wooget packages easier"
  homepage "https://github.com/wooga/wtf"

  head "https://github.com/wooga/wtf.git", :branch => "homebrew_publish"

  stable do
    url "https://github.com/wooga/wtf/archive/wooga_wtf-0.5.1.gem.tar.gz"
    sha256 "b9ef2ba7a664d0703a47268186036806ef8bbb99065665197575dbd5acf7137d"
  end

  depends_on 'wooga/tools/unity-version-manager' => :run
  depends_on "mono" => :run
  depends_on 'Caskroom/cask/unity' => :optional
  depends_on 'Caskroom/cask/unity-android-support-for-editor' => :optional

  resource "CFPropertyList" do
    url "https://rubygems.org/gems/CFPropertyList-2.2.8.gem"
    sha256 "b693d9b4e6609c9dcdb651d0d65a3bdb54c04cdc16291b4272a86f48e51f57b7"
  end

  resource "activesupport" do
    url "https://rubygems.org/gems/activesupport-4.2.7.1.gem"
    sha256 "241bbcefbd472a2685e84952ca9c0dbec5665121ea88b312602c777ba608babd"
  end

  resource "activesupport-json_encoder" do
    url "https://rubygems.org/gems/activesupport-json_encoder-1.1.0.gem"
    sha256 "f4e06533f6844d18b3b2f1834576f02d17aaf81a2f65576e610c2cfd3c395e3c"
  end

  resource "addressable" do
    url "https://rubygems.org/gems/addressable-2.5.0.gem"
    sha256 "bc5bf921b39640675fbb3484cdb45e4241b4c88d8d5a7d85a3985424ad02b9c8"
  end

  resource "ansi" do
    url "https://rubygems.org/gems/ansi-1.5.0.gem"
    sha256 "5408253274e33d9d27d4a98c46d2998266fd51cba58a7eb9d08f50e57ed23592"
  end

  resource "byebug" do
    url "https://rubygems.org/gems/byebug-4.0.5.gem"
    sha256 "091400e903204f0e5ebc7ca042791e82bcb08107d743f9341f7f2f244adf5402"
  end

  resource "coderay" do
    url "https://rubygems.org/gems/coderay-1.1.1.gem"
    sha256 "79a42eba4cbe2b056ba253eb02d1a7aec74ca951e54f33098830641e8748dff4"
  end

  resource "columnize" do
    url "https://rubygems.org/gems/columnize-0.9.0.gem"
    sha256 "ab736fad789612458feef028cb6c98cd2e54cb21174e5744c8a5204a6dc962a0"
  end

  resource "curb" do
    url "https://rubygems.org/gems/curb-0.9.3.gem"
    sha256 "42651d05f712a93fb9cc733910b285d389afbd16952d456b13733b12a403e009"
  end

  resource "faraday" do
    url "https://rubygems.org/gems/faraday-0.11.0.gem"
    sha256 "5986f49009d638d971997082f1a6cf1ed835144a66d5c11dd495bf1d9b66e1a2"
  end

  resource "httpclient" do
    url "https://rubygems.org/gems/httpclient-2.8.3.gem"
    sha256 "2951e4991214464c3e92107e46438527d23048e634f3aee91c719e0bdfaebda6"
  end

  resource "i18n" do
    url "https://rubygems.org/gems/i18n-0.8.0.gem"
    sha256 "eefbf6cbe4432e41e6ad69bd2a1f6df1130f65bf6ad036c8344b25840fa5da02"
  end

  resource "json" do
    url "https://rubygems.org/gems/json-1.8.6.gem"
    sha256 "65af27ca985f70eb0d083aab0f75712c771871222af021ce533bad77bd3bb262"
  end

  resource "method_source" do
    url "https://rubygems.org/gems/method_source-0.8.2.gem"
    sha256 "c2e9d0f4ebefd6b37efe38fe2964337b1d315fe198cad850681fd2da0027b1bc"
  end

  resource "mini_portile2" do
    url "https://rubygems.org/gems/mini_portile2-2.1.0.gem"
    sha256 "0b0e83fe0fc190640a93c48cef0c8e1f1f40f77840d82c160fefc1b07a5345f8"
  end

  resource "minitest" do
    url "https://rubygems.org/gems/minitest-5.10.1.gem"
    sha256 "4bf1fcf3306977f97348ff3c46520191a853c2637628aea20db55c7035aa62fa"
  end

  resource "multipart-post" do
    url "https://rubygems.org/gems/multipart-post-2.0.0.gem"
    sha256 "3dc44e50d3df3d42da2b86272c568fd7b75c928d8af3cc5f9834e2e5d9586026"
  end

  resource "octokit" do
    url "https://rubygems.org/gems/octokit-4.6.2.gem"
    sha256 "edcacd3102497dd2f99f0e60309ada82f4a987a7cd98a51b5bd455840173f7ae"
  end

  resource "oga" do
    url "https://rubygems.org/gems/oga-2.9.gem"
    sha256 "fb9c1a55e1f2c94af0d30c437c9be233df8a4758856f280f7a83c2aa960ac0a4"
  end

  resource "pry" do
    url "https://rubygems.org/gems/pry-0.10.4.gem"
    sha256 "5909a2bf85640bb757f930a03a528b55b8569ac0cba19df315520d63a3ffab17"
  end

  resource "pry-byebug" do
    url "https://rubygems.org/gems/pry-byebug-3.1.0.gem"
    sha256 "ddcb0bbc844b205cb59a6006d68a5b752a2a38c8b42e1adbfbe438d44e15a5ac"
  end

  resource "public_suffix" do
    url "https://rubygems.org/gems/public_suffix-2.0.5.gem"
    sha256 "f8488b110921532ff291af74eef70fa4e3c036141c4ef80009dcdc2b51721210"
  end

  resource "rake" do
    url "https://rubygems.org/gems/rake-10.5.0.gem"
    sha256 "2b55a1ad44b5c945719d8a97c302a316af770b835187d12143e83069df5a8a49"
  end

  resource "ruby-ll" do
    url "https://rubygems.org/gems/ruby-ll-2.1.2.gem"
    sha256 "167fd5254f2dc765d63ca5cfee8806edd14e81069e5f1312f9ac61ee559d3c43"
  end

  resource "rubyzip" do
    url "https://rubygems.org/gems/rubyzip-1.2.1.gem"
    sha256 "1f7f53c83752517fe764fe9451294d6f879d5e65b2ee46055308be6fff235a1a"
  end

  resource "sawyer" do
    url "https://rubygems.org/gems/sawyer-0.8.1.gem"
    sha256 "6d37c1db3673607bb9de868d1d9c363be753cd68b5e1dc48df1faf938721616b"
  end

  resource "slop" do
    url "https://rubygems.org/gems/slop-3.6.0.gem"
    sha256 "76ccab03be66bfcab4838cdc07cab019cd3e192a3538266246749e79e4788803"
  end

  resource "thor" do
    url "https://rubygems.org/gems/thor-0.19.4.gem"
    sha256 "da8aa62e197c5c203d9dc3db06314abdab2d8dc9807d0094a9c0503cd36ec506"
  end

  resource "thread_safe" do
    url "https://rubygems.org/gems/thread_safe-0.3.5.gem"
    sha256 "993da065f98b8575c537ebf984ffb79eecdb6064559a3b9d2a9d7aaf313704c3"
  end

  resource "tzinfo" do
    url "https://rubygems.org/gems/tzinfo-1.2.2.gem"
    sha256 "fdb1d3fdf2776d490c82a0e589a08e7cbde70ac1ae7d2b1f0b7e77f3e6b801b0"
  end

  resource "waitutil" do
    url "https://rubygems.org/gems/waitutil-0.2.1.gem"
    sha256 "881f3e6458d759c2c8fe4b75e8989963b70c9a15ed0a5b72d29c36933cdee5d2"
  end

  resource "wooga_wooget" do
    url "https://rubygems.org/gems/wooga_wooget-2.5.2.gem"
    sha256 "4bdf4427cbf16115db46c3e050ba9227c8942cc6d2d58ff810aed27b33ddb563"
  end

  resource "nokogiri" do
    url "https://rubygems.org/downloads/nokogiri-1.6.8.1-x86-mingw32.gem"
    sha256 "c918a99d2e24a3cbd9f4faad87b8ad46084da184a0f65e1d0e9cd7d7dc4fd7a7"
  end

  def install
    ENV["GEM_HOME"] = libexec/"vendor"

    inreplace (buildpath/"lib/wtf/version.rb"), /"([\da-z\.]+)"/, '"\1-HEAD"' if build.head?

    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system "gem", "install", r.cached_download, "--no-document"
    end

    system "gem", "build", "wtf.gemspec"
    system "gem", "install", Dir["wooga_wtf-*.gem"].first

    bin.install libexec/"vendor/bin/wtf"

    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/wtf"
  end
end
