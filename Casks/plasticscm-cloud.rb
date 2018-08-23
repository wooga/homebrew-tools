cask 'plasticscm-cloud' do

  version '7.0.16.2505'
  sha256 "78c66572adf68eea54379bb8e6f0176ceb748f90049368a654c708fdfaf2bfe8"

  url "https://s3.eu-west-2.amazonaws.com/plastic-releases/releases/#{version}/plasticscm/osx/plasticscm-cloud-#{version}.pkg.zip"
  name 'plasticscm-cloud'
  homepage 'https://www.plasticscm.com'

  container type: :zip

  pkg "plasticscm-cloud-#{version}.pkg"
end
