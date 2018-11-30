cask 'android-sdk' do
  version '4333796'
  sha256 'ecb29358bc0f13d7c2fa0f9290135a5b608e38434aad9bf7067d0252c160853e'

  # dl.google.com/android/repository was verified as official when first introduced to the cask
  url "https://dl.google.com/android/repository/sdk-tools-darwin-#{version}.zip"
  name 'android-sdk'
  homepage 'https://developer.android.com/index.html'

  build_tools_version = '28.0.3'

  binary "#{staged_path}/build-tools/#{build_tools_version}/aapt"
  binary "#{staged_path}/build-tools/#{build_tools_version}/aapt2"
  binary "#{staged_path}/build-tools/#{build_tools_version}/aidl"
  binary "#{staged_path}/build-tools/#{build_tools_version}/apksigner"
  binary "#{staged_path}/build-tools/#{build_tools_version}/dexdump"
  binary "#{staged_path}/build-tools/#{build_tools_version}/dx"
  binary "#{staged_path}/build-tools/#{build_tools_version}/llvm-rs-cc"
  binary "#{staged_path}/build-tools/#{build_tools_version}/zipalign"

  binary "#{staged_path}/platform-tools/adb"
  binary "#{staged_path}/platform-tools/dmtracedump"
  binary "#{staged_path}/platform-tools/etc1tool"
  binary "#{staged_path}/platform-tools/fastboot"
  binary "#{staged_path}/platform-tools/hprof-conv"
  binary "#{staged_path}/platform-tools/sqlite3"

  binary "#{staged_path}/tools/android"
  binary "#{staged_path}/tools/bin/archquery"
  binary "#{staged_path}/tools/bin/avdmanager"
  binary "#{staged_path}/tools/bin/jobb"
  binary "#{staged_path}/tools/bin/lint"
  binary "#{staged_path}/tools/bin/monkeyrunner"
  binary "#{staged_path}/tools/bin/screenshot2"
  binary "#{staged_path}/tools/bin/sdkmanager"
  binary "#{staged_path}/tools/bin/uiautomatorviewer"
  binary "#{staged_path}/tools/emulator"
  binary "#{staged_path}/tools/emulator-check"
  binary "#{staged_path}/tools/mksdcard"
binary "#{staged_path}/tools/monitor"

  preflight do

   system_command "#{staged_path}/tools/bin/sdkmanager", args: ['platform-tools',
    'build-tools;26.0.3',
    'build-tools;27.0.3',
    'build-tools;28.0.3',
    'platforms;android-25',
    'platforms;android-26',
    'platforms;android-27',
    'platforms;android-28',
    'extras;google;m2repository',
    'extras;android;m2repository'], input: 'y'
  end

  postflight do
    FileUtils.ln_sf(staged_path.to_s, "#{HOMEBREW_PREFIX}/share/android-sdk")
  end

  uninstall_postflight do
    FileUtils.rm("#{HOMEBREW_PREFIX}/share/android-sdk")
  end

  caveats do
    depends_on_java '8'
    <<~EOS
      You can control android sdk packages via the sdkmanager command.
      You may want to add to your profile:
        'export ANDROID_SDK_ROOT="#{HOMEBREW_PREFIX}/share/android-sdk"'
    EOS
  end
end
