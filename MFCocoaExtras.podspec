#
# Be sure to run `pod lib lint MFCocoaExtras.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MFCocoaExtras"
  s.version          = "1.0.0"
  s.summary          = "MFCocoaExtras is a cross-platofrm (iOS/MacOS) Utility Library."
  s.description      = <<-DESC
                    MFCocoaExtras is a cross-platofrm (iOS/MacOS) Utility Library build on Cocoa or CocoaTouch (UIKit) frameworks.
                    It includes
                    - Convenient extras ( categories ) on some Cocoa classes
                    - Graphics Utilities
                    - Security
                       DESC
  s.homepage         = "https://github.com/moosefactory/MFCocoaExtras"
  s.license          = 'MIT'
  s.author           = { "Tristan Leblanc" => "tristan@moosefactory.eu" }
  s.source           = { :git => "https://github.com/moosefactory/MFCocoaExtras.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/moosefactory_eu'

    s.ios.deployment_target = '6.0'
    s.osx.deployment_target = '10.8'
    s.requires_arc = true

  s.source_files = 'MFCocoaExtras/**/*'

    s.frameworks = 'CoreGraphics', 'UIKit', 'MFFoundation'
end
