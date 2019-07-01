class UnityVersionManager < Formula
  desc "Tool that just manipulates a link to the current unity version"
  homepage "https://github.com/Larusso/unity-version-manager"
  head "https://github.com/Larusso/unity-version-manager.git"
  version "2.2.0"

  stable do
    url "https://github.com/Larusso/unity-version-manager/archive/v#{version}.tar.gz"
    sha256 "321b0f6e9c85e53b4c7a3e03e751cc9e4ab946d4ee9e36aa8a39d1f180f1d621"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
