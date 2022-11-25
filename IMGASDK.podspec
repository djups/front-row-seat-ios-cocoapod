#
#  Be sure to run `pod spec lint 2CodersFrameworkPod.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "IMGASDK"
spec.version        = "0.4"
  spec.summary      = "IMGA SDK"
  spec.description  = <<-DESC
  IMGA SDK for iOS is library for iOS providing a powerful high-level webview abstractions to interact with the IMGA web app. 

                   DESC

  spec.homepage     = "https://github.com/IMGARENA/front-row-seat-ios-cocoapod"
  spec.license      = "IMG Media Limited"
  spec.author       = { "David Santana" => "david@2coders.com" }
  spec.source       = { :git => "https://github.com/IMGARENA/front-row-seat-ios-cocoapod.git", :tag => "v3.0"}
  spec.vendored_frameworks = "IMGA.xcframework"
  spec.platform = :ios
  spec.swift_version = "5.1"
  spec.ios.deployment_target  = '14.0'
  spec.dependency 'SnapKit', '~> 5.0.1'

end
