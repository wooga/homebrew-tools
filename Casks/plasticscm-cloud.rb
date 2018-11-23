cask 'plasticscm-cloud' do
  version '7.0.16.2782'
  sha256 "7b4db0be08196c9545feb4dfa4bdb86443244235cca989ecba14ad6e5090d45f"

  url "https://s3.eu-west-2.amazonaws.com/plastic-releases/releases/#{version}/plasticscm/osx/plasticscm-cloud-#{version}.pkg.zip"
  name 'plasticscm-cloud'
  homepage 'https://www.plasticscm.com'

  container type: :zip

  pkg "plasticscm-cloud-#{version}.pkg"
end
