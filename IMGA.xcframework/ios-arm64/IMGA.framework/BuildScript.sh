#  BuildScript.sh
#  IMGA
#
#  Created by David Santana Molina on 19/5/21.
#  Execute with sh /Resources/BuildScript.sh
#  Create an XCFramework https://help.apple.com/xcode/mac/11.4/#/dev544efab96


echo "Building for iOS..."
xcodebuild archive \
    -sdk iphoneos IPHONEOS_DEPLOYMENT_TARGET=12.1 \
    -arch arm64 \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    -scheme "IMGA" \
    -archivePath "./build/IMGASDK.framework-iphoneos.xcarchive" SKIP_INSTALL=NO

echo "Building for iOS Simulator... # Added arm64 arch for M1"
xcodebuild archive \
    -sdk iphonesimulator IPHONEOS_DEPLOYMENT_TARGET=12.1 \
    -arch x86_64 -arch arm64 \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    -scheme "IMGA" \
    -archivePath "./build/IMGASDK.framework-iphonesimulator.xcarchive" SKIP_INSTALL=NO

#echo "Building for Catalyst..."
#xcodebuild archive \
#    MACOSX_DEPLOYMENT_TARGET=10.15 \
#    -destination "platform=macOS,variant=Mac Catalyst" \
#    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
#    -scheme "IMGA" \
#    -archivePath "./build/IMGASDK.framework-catalyst.xcarchive" SKIP_INSTALL=NO
#
#echo "Building for macOS... # Added arm64 arch for M1 "
#xcodebuild archive \
#    -sdk macosx MACOSX_DEPLOYMENT_TARGET=11.0 \
#    -arch x86_64 -arch arm64 \
#    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
#    -scheme "IMGA" \
#    -archivePath "./build/IMGASDK.framework-macos.xcarchive" SKIP_INSTALL=NO

echo "Building XCFramework..."
xcodebuild -create-xcframework -output './build/IMGA.xcframework' \
    -framework './build/IMGASDK.framework-iphoneos.xcarchive/Products/Library/Frameworks/IMGA.framework' \
    -framework './build/IMGASDK.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/IMGA.framework'
#    -framework './build/IMGASDK.framework-catalyst.xcarchive/Products/Library/Frameworks/IMGA.framework' \
#    -framework './build/IMGASDK.framework-macos.xcarchive/Products/Library/Frameworks/IMGA.framework'
