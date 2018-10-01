class UnityVersionManager < Formula
  desc "Tool that just manipulates a link to the current unity version"
  homepage "https://github.com/Larusso/unity-version-manager"
  head "https://github.com/Larusso/unity-version-manager.git"
  version "2.0.0"

  stable do
    url "https://github.com/Larusso/unity-version-manager/archive/v#{version}.tar.gz"
    sha256 "b93138dd10445ff94d68f7353e286d5ab2e142e98a55cddf458279b73c265d5a"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
