class InstallUnity < Formula
  desc "Python Script to convert NUnit3 report xml files to NUnit2 format"
  homepage "https://github.com/wooga/NUnit3-to-NUnit2-Format-Converter"

  head "https://github.com/wooga/NUnit3-to-NUnit2-Format-Converter.git"

  stable do
    url "https://github.com/wooga/NUnit3-to-NUnit2-Format-Converter/archive/v1.0.0.zip"
    sha256 "715328c7d6c61ac277ede84ad90cc4dc3f9b6db21226495eb298ca21a0aae4ff"
  end

  def install
    mv "nunit3-format-converter.py", "nunit3-format-converter"
    libexec.install "nunit3-format-converter"
    bin.install_symlink libexec/"nunit3-format-converter"
  end

  test do
    system "#{bin}/nunit3-format-converter", "--help"
  end
end
