class UnityVersionManager < Formula
  desc "Tool that just manipulates a link to the current unity version"
  homepage "https://github.com/Larusso/unity-version-manager"
  head "https://github.com/Larusso/unity-version-manager.git"
  version "2.4.1"

  stable do
    url "https://github.com/Larusso/unity-version-manager/archive/v#{version}.tar.gz"
    sha256 "86e3e06375ceb977673c6348358b971d3208e7e88513d9ab5ca6ad7cdfb0d0a6"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
