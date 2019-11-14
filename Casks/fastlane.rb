cask 'fastlane' do
  version :latest
  sha256 :no_check

  url 'https://github.com/wooga/packaged-fastlane/archive/custom_fix.tar.gz'
  name 'fastlane'
  homepage 'https://fastlane.tools/'

  installer script: {
                      executable: "#{staged_path}/packaged-fastlane-custom_fix/install",
                      args:       ['-p', '-b'],
                    }

  uninstall script: {
                      executable: "#{staged_path}/packaged-fastlane-custom_fix/uninstall",
                      args:       ['-y'],
                    }

end
