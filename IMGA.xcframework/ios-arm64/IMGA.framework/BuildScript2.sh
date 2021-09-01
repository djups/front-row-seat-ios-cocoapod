

#  BuildScript2.sh
#  IMGA
#
#  Created by David Santana Molina on 19/5/21.
#  


#!/bin/bash

# This script builds a very simple library for illustrative purposes.

FRAMEWORK_NAME="IMGA"
SCHEME_NAME="IMGA"
DEPLOYMENT_TARGET=12.1

echo "Cleaning... $FRAMEWORK_NAME"

rm -rf ./build
rm ./$FRAMEWORK_NAME.framework
rm -rf ./$FRAMEWORK_NAME.xcframework


echo "Building for iOS..."
xcodebuild archive \
    -sdk iphoneos IPHONEOS_DEPLOYMENT_TARGET=$DEPLOYMENT_TARGET \
    -arch arm64 \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    -scheme $SCHEME_NAME \
    -archivePath "./build/iphoneos/${FRAMEWORK_NAME}.xcarchive" SKIP_INSTALL=NO

echo "Building for iOS Simulator..."
xcodebuild archive \
    -sdk iphonesimulator IPHONEOS_DEPLOYMENT_TARGET=$DEPLOYMENT_TARGET \
    -arch x86_64 -arch arm64 \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    -scheme $SCHEME_NAME \
    -archivePath "./build/iphonesimulator/${FRAMEWORK_NAME}.xcarchive" SKIP_INSTALL=NO

# The old way - building a framework that supports iOS and Simulator by lipo-ing them into one framework
#echo "Building Framework with iOS and iOS Simulator support..."
#lipo -create -output "./$FRAMEWORK_NAME.framework" \
#	"./build/iphoneos/$FRAMEWORK_NAME.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework/$FRAMEWORK_NAME" \
#	"./build/iphonesimulator/$FRAMEWORK_NAME.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework/$FRAMEWORK_NAME.xcarchive"

# The new way - building an xcframework that supports everything
echo "Building XCFramework..."
xcodebuild -create-xcframework -output ./build/$FRAMEWORK_NAME.xcframework \
	-framework "./build/iphoneos/$FRAMEWORK_NAME.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
	-framework "./build/iphonesimulator/$FRAMEWORK_NAME.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
