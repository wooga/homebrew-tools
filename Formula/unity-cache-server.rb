class UnityCacheServer < Formula
  desc "unity cache server"
  homepage "https://unity.com"
  version "6.0.2"
  keg_only "service only"

  stable do
    url "https://github.com/Unity-Technologies/unity-cache-server/archive/v6.0.2.tar.gz"
    sha256 "71476cd26fab1d73d86159f555231ce5cf2faedf1c6f2990d0cec568201f7025"
  end

  depends_on 'node'
  depends_on 'unity-cache-server-cleanup'

  plist_options :startup => true

  def install

    mkdir_p(etc/"#{name}/config")
    mkdir_p(var/"log/#{name}")
    mkdir_p(var/"cache/#{name}")

    lib.install Dir["lib/*"]
    cp Dir["config/*"], etc/"#{name}/config"
    prefix.install "main.js"
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>node</string>
          <string>#{prefix}/main.js</string>
          <string>--cache-module cache_fs</string>
          <string>--cache-path #{var}/cache/#{name}</string>
          <string>--NODE_CONFIG_DIR #{etc}/#{name}/config</string>
        </array>

        <key>RunAtLoad</key>
        <true/>

        <key>KeepAlive</key>
        <true/>

        <key>StandardOutPath</key>
        <string>#{var}/log/#{name}/stdout.log</string>

        <key>StandardErrorPath</key>
        <string>#{var}/log/#{name}/error.log</string>
      </dict>
    </plist>
  EOS
  end
end