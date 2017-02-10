class UnityVersionManager < Formula
  desc "Tool that just manipulates a link to the current unity version"
  homepage "https://github.com/wooga/unity-version-manager"
  head "https://github.com/wooga/unity-version-manager.git"
  
  stable do
    url "https://github.com/wooga/unity-version-manager/archive/wooga_uvm-0.3.1.tar.gz"
    sha256 "288d88a13e801f3fa71491381c8933b81f20ca56efe769b4ffcfcb972dc0404b"
  end

  def install
    ENV["GEM_HOME"] = libexec
    
    version_code = (build.head?) ? "*" : version

    system "gem", "build", "uvm.gemspec"
    system "gem", "install", "wooga_uvm-#{version_code}.gem"
     
    bin.install libexec/"bin/uvm"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/uvm"
  end
end
