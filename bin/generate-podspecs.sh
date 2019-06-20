#!/bin/sh

# Exit if any command fails
set -e

# Change to the expected directory.
cd "$( dirname $0 )"
cd ..

# Check for cocoapods
command -v pod > /dev/null || ( echo Cocoapods is required to generate podspecs; exit 1 )

PODSPECS=$(cat <<EOP
node_modules/react-native/React.podspec
node_modules/react-native/ReactCommon/yoga/yoga.podspec
node_modules/react-native/third-party-podspecs/Folly.podspec
node_modules/react-native/third-party-podspecs/DoubleConversion.podspec
node_modules/react-native/third-party-podspecs/glog.podspec
node_modules/react-native/React/React-Core.podspec
node_modules/react-native/React/React-DevSupport.podspec
node_modules/react-native/ReactCommon/cxxreact/React-cxxreact.podspec
node_modules/react-native/ReactCommon/jsinspector/React-jsinspector.podspec
node_modules/react-native/ReactCommon/jsiexecutor/React-jsiexecutor.podspec
node_modules/react-native/ReactCommon/jsi/React-jsi.podspec
node_modules/react-native/Libraries/WebSocket/React-RCTWebSocket.podspec
node_modules/react-native/Libraries/fishhook/React-fishhook.podspec
node_modules/react-native/Libraries/ActionSheetIOS/React-RCTActionSheet.podspec
node_modules/react-native/Libraries/NativeAnimation/React-RCTAnimation.podspec
node_modules/react-native/Libraries/Blob/React-RCTBlob.podspec
node_modules/react-native/Libraries/Image/React-RCTImage.podspec
node_modules/react-native/Libraries/Network/React-RCTNetwork.podspec
node_modules/react-native/Libraries/LinkingIOS/React-RCTLinking.podspec
node_modules/react-native/Libraries/Settings/React-RCTSettings.podspec
node_modules/react-native/Libraries/Text/React-RCTText.podspec
node_modules/react-native/Libraries/Vibration/React-RCTVibration.podspec
EOP
)

DEST="react-native-gutenberg-bridge/third-party-podspecs"

for podspec in $PODSPECS
do
    pod=`basename $podspec .podspec`
    echo "Generating podspec for $pod"
    INSTALL_YOGA_WITHOUT_PATH_OPTION=1 pod ipc spec $podspec > "$DEST/$pod.podspec.json"
done