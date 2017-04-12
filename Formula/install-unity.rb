class InstallUnity < Formula
  desc "Script to install Unity 3D versions from the command-line on OS X"
  homepage "https://github.com/sttz/install-unity"

  head "https://github.com/sttz/install-unity.git"

  stable do
    url "https://github.com/sttz/install-unity/archive/0.0.4.tar.gz"
    sha256 "d0bd2d51b0e2915fa50378bfee78d0033a1b050f4a0e3f1f994c85fff675d74d"
  end

  def install
    mv "install-unity.py", "install-unity"
    libexec.install "install-unity"
    bin.install_symlink libexec/"install-unity"
  end

  test do
    system "#{bin}/install-unity", "--version"
  end
end
