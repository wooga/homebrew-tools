class UnityVersionManager < Formula
  desc "Tool that just manipulates a link to the current unity version"
  homepage "https://github.com/Larusso/unity-version-manager"
  head "https://github.com/Larusso/unity-version-manager.git"
  version "2.0.1"

  stable do
    url "https://github.com/Larusso/unity-version-manager/archive/v#{version}.tar.gz"
    sha256 "0ecc4ad813b91e769f8b7012ea3119d802d00afb0764e2c4fca0a33611de0f70" 
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    args = ["PREFIX=#{prefix}"]
    bin.mkpath
    system "make", "install", *args
  end
end
