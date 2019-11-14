cask 'fastlane' do
  version :latest
  sha256 :no_check

  url 'https://github.com/wooga/packaged-fastlane/archive/custom_fix.tar.gz'
  name 'fastlane'
  homepage 'https://fastlane.tools/'

  binary "#{staged_path}/fastlane_lib/fastlane"

  installer script: {
                      executable: "#{staged_path}/install",
                      args:       ['-p', '-u', '-b'],
                    }

  uninstall script: {
                      executable: "#{staged_path}/uninstall",
                      args:       ['-y'],
                    }

end
