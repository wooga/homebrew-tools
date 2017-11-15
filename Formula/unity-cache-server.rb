class UnityCacheServer < Formula
  desc "unity cache server"
  homepage "https://unity.com"
  version "2017.2.0f3"

  stable do
    url "https://netstorage.unity3d.com/unity/46dda1414e51/CacheServer-2017.2.0f3.zip"
    sha256 "7f245500f106ce7e354bebaa2fc8c5906c11716696daf0b16482becd3d5ef155"
  end

  def install
    bin.install Dir["nodejs/osx/bin/*"]
    include.install Dir["nodejs/osx/include/*"]
    lib.install Dir["nodejs/osx/lib/*"]
    share.install Dir["nodejs/osx/share/*"]
    prefix.install "CacheServer.js", "LegacyCacheServer.js", "main.js"
  end

  plist_options :manual => "unity-cache-server"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/node</string>
          <string>#{prefix}/main.js</string>
          <string>--path #{info}/cache</string>
          <string>--nolegacy</string>
        </array>

        <key>RunAtLoad</key>
        <true/>

        <key>KeepAlive</key>
        <true/>

        <key>StandardOutPath</key>
        <string>#{info}/logs/#{plist_name}.stdout</string>

        <key>StandardErrorPath</key>
        <string>#{info}/logs/#{plist_name}.stderr</string>
      </dict>
    </plist>
  EOS
  end
end