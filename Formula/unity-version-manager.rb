class UnityVersionManager < Formula
  desc "A commandline client to installa and manage Unity Editor installations"
  homepage "https://github.com/Larusso/unity-version-manager"
  head "https://github.com/Larusso/unity-version-manager.git"
  version "2.6.0"

  stable do
    url "https://github.com/Larusso/unity-version-manager/archive/v#{version}.tar.gz"
    sha256 "5c88a14c804bfb8213cea930e6c440e6844023584699ffd4432ddd2c3c73ef52"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
