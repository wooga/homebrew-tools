class UnityVersionManager < Formula
  desc "Tool that just manipulates a link to the current unity version"
  homepage "https://github.com/Larusso/unity-version-manager"
  head "https://github.com/Larusso/unity-version-manager.git"
  version "2.4.0"

  stable do
    url "https://github.com/Larusso/unity-version-manager/archive/v#{version}.tar.gz"
    sha256 "6df35730ad0649ca2699b6a4f93ee601df8eac89e86bad3028d20b8720ae6dbf"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
