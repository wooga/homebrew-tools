cask 'fastlane' do
  version :latest
  sha256 :no_check

  url 'https://fastlane.tools/fastlane.zip'
  name 'fastlane'
  homepage 'https://fastlane.tools/'

  binary "#{staged_path}/fastlane_lib/snapshot"
  binary "#{staged_path}/fastlane_lib/sigh"
  binary "#{staged_path}/fastlane_lib/scan"
  binary "#{staged_path}/fastlane_lib/produce"
  binary "#{staged_path}/fastlane_lib/pem"
  binary "#{staged_path}/fastlane_lib/match"
  binary "#{staged_path}/fastlane_lib/gym"
  binary "#{staged_path}/fastlane_lib/frameit"
  binary "#{staged_path}/fastlane_lib/fastlane"
  binary "#{staged_path}/fastlane_lib/deliver"
  binary "#{staged_path}/fastlane_lib/cert"
  binary "#{staged_path}/fastlane_lib/bundle"
  binary "#{staged_path}/fastlane_lib/bundle_update_checker.rb"
  binary "#{staged_path}/fastlane_lib/parse_env.rb"
  binary "#{staged_path}/fastlane_lib/VERSION"

  preflight do
    system_command "sed", args: ['-i', '', "s/{{IS_INSTALLED_VIA_HOMEBREW}}/$INSTALLED_VIA_HOMEBREW/g", "#{staged_path}/fastlane_lib/bundle/bin/bundle-env"]
    system_command "#{staged_path}/fastlane_lib/fastlane", args: ["update_fastlane"]
  end
end
