#!/bin/sh

#
# Script to rebrand Smuck and make your own project.
#
# Usage: ./smuckify.sh ProjectName BundleIdentifier CopyrightName
#
# Example ./smuckify.sh "MyApp" "com.example" "John Appleseed"
#
# This will rebrand Smuck to MyApp with the bundle identifier
# com.example.MyApp and change all copyright stuff to
# John Appleseed. 
#
# It will also take care of the 'created by' dates.
#
# smuckify.sh needs to be run from the root directory of 
# the Smuck project.
#

PROJECT_NAME=$1
BUNDLE_ID=$2
COPYRIGHT=$3

YEAR=`date +%Y`
DATE=`date +%d/%m/%y`
DATE=${DATE//\//\\/}


PROJECT_KIT="${PROJECT_NAME}Kit"
PROJECT_KIT_TESTS="${PROJECT_NAME}KitTests"
PROJECT_KIT_OSX="${PROJECT_NAME}KitOSX"
PROJECT_KIT_OSX_TESTS="${PROJECT_NAME}KitOSXTests"
PROJECT_KIT_IOS="${PROJECT_NAME}KitIOS"
PROJECT_KIT_IOS_TESTS="${PROJECT_NAME}KitIOSTests"

PROJECT_OSX="${PROJECT_NAME}OSX"
PROJECT_OSX_TESTS="${PROJECT_NAME}OSXTests"

PROJECT_IOS="${PROJECT_NAME}IOS"
PROJECT_IOS_TESTS="${PROJECT_NAME}IOSTests"

set -e

if [ -z "$PROJECT_NAME" ]; then
    echo "Project name is required"
    exit 1
fi

if [ -z "$BUNDLE_ID" ]; then
    echo "Bundle identifier is required"
    exit 1
fi

if [ -z "$COPYRIGHT" ]; then
    echo "Copyright is required"
    exit 1
fi

echo "Renaming Smuck to $PROJECT_NAME with bundle identifier $BUNDLE_ID and copyright $COPYRIGHT"

read -r -p "Are you sure? [y/N] " PROCEED
if [[ $PROCEED =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "Proceeding with smuckification..."
else
    exit 0
fi

function _replace {
	if [ -f "$1" ]; then
		sed -E -i "" "s/Smuck/$PROJECT_NAME/g" "$1"
		sed -E -i "" "s/net\.hardersen/$BUNDLE_ID/g" "$1"
		sed -E -i "" "s/Trygve Sanne Hardersen/$COPYRIGHT/g" "$1"
		sed -E -i "" "s/Created by $COPYRIGHT on [[:digit:]]{2}\/[[:digit:]]{2}\/[[:digit:]]{2}\./Created by $COPYRIGHT on $DATE\./g" "$1"
		sed -E -i "" "s/Copyright \(c\) [[:digit:]]{4} $COPYRIGHT/Copyright (c) $YEAR $COPYRIGHT/g" "$1"
	fi
}

function _mvdir {
	if [ -d "$1" ]; then
		mv "$1" "$2"
	fi
}

function _mvfile {
	if [ -f "$1" ]; then
		mv "$1" "$2"
		_replace "$2"
	fi
}

function _rmdir {
	if [ -d "$1" ]; then
		rm -r "$1"
	fi
}

function _rmfile {
	if [ -f "$1" ]; then
		rm "$1"
	fi
}

##############
### Global ###
##############

# Git
rm -rf "./.git"

# LICENSE and README
_rmfile "./LICENSE"
_rmfile "./README.md"

#################
### Workspace ###
#################

# Xcode workspace
_replace "./Smuck.xcworkspace/contents.xcworkspacedata"
_rmdir "./Smuck.xcworkspace/xcuserdata"
_rmfile "./Smuck.xcworkspace/xcshareddata/Smuck.xccheckout"
_mvdir "./Smuck.xcworkspace" "./$PROJECT_NAME.xcworkspace"

################
### SmuckKit ###
################

# Xcode project
_rmdir "./SmuckKit/SmuckKit.xcodeproj/xcuserdata"
_replace "./SmuckKit/SmuckKit.xcodeproj/project.pbxproj"
_mvdir "./SmuckKit/SmuckKit.xcodeproj" "./SmuckKit/$PROJECT_KIT.xcodeproj"

# SmuckKit
_mvfile "./SmuckKit/SmuckKit/SmuckKit.h" "./SmuckKit/SmuckKit/$PROJECT_KIT.h"
_mvfile "./SmuckKit/SmuckKit/Smuck.h" "./SmuckKit/SmuckKit/$PROJECT_NAME.h"
_mvfile "./SmuckKit/SmuckKit/Smuck.m" "./SmuckKit/SmuckKit/$PROJECT_NAME.m"
_mvdir "./SmuckKit/SmuckKit" "./SmuckKit/$PROJECT_KIT"

# SmuckKitTests
_mvfile "./SmuckKit/SmuckKitTests/SmuckKitTests.m" "./SmuckKit/SmuckKitTests/$PROJECT_KIT_TESTS.m"
_mvdir "./SmuckKit/SmuckKitTests" "./SmuckKit/$PROJECT_KIT_TESTS"

# SmuckKitOSX
_replace "./SmuckKit/SmuckKitOSX/Info.plist"
_mvfile "./SmuckKit/SmuckKitOSX/SmuckKitOSX.h" "./SmuckKit/SmuckKitOSX/$PROJECT_KIT_OSX.h"
_mvfile "./SmuckKit/SmuckKitOSX/SmuckOSX.h" "./SmuckKit/SmuckKitOSX/$PROJECT_OSX.h"
_mvfile "./SmuckKit/SmuckKitOSX/SmuckOSX.m" "./SmuckKit/SmuckKitOSX/$PROJECT_OSX.m"
_mvdir "./SmuckKit/SmuckKitOSX" "./SmuckKit/$PROJECT_KIT_OSX"

# SmuckKitOSXTests
_replace "./SmuckKit/SmuckKitOSXTests/Info.plist"
_mvfile "./SmuckKit/SmuckKitOSXTests/SmuckKitOSXTests.m" "./SmuckKit/SmuckKitOSXTests/$PROJECT_KIT_OSX_TESTS.m"
_mvdir "./SmuckKit/SmuckKitOSXTests" "./SmuckKit/$PROJECT_KIT_OSX_TESTS"

# SmuckKitIOS
_replace "./SmuckKit/SmuckKitIOS/Info.plist"
_mvfile "./SmuckKit/SmuckKitIOS/SmuckKitIOS.h" "./SmuckKit/SmuckKitIOS/$PROJECT_KIT_IOS.h"
_mvfile "./SmuckKit/SmuckKitIOS/SmuckIOS.h" "./SmuckKit/SmuckKitIOS/$PROJECT_IOS.h"
_mvfile "./SmuckKit/SmuckKitIOS/SmuckIOS.m" "./SmuckKit/SmuckKitIOS/$PROJECT_IOS.m"
_mvdir "./SmuckKit/SmuckKitIOS" "./SmuckKit/$PROJECT_KIT_IOS"

# SmuckKitIOSTests
_replace "./SmuckKit/SmuckKitIOSTests/Info.plist"
_mvfile "./SmuckKit/SmuckKitIOSTests/SmuckKitIOSTests.m" "./SmuckKit/SmuckKitIOSTests/$PROJECT_KIT_IOS_TESTS.m"
_mvdir "./SmuckKit/SmuckKitIOSTests" "./SmuckKit/$PROJECT_KIT_IOS_TESTS"

# SmuckKit root
_mvdir "./SmuckKit" "./$PROJECT_KIT"

################
### SmuckOSX ###
################

# Xcode project
_rmdir "./SmuckOSX/SmuckOSX.xcodeproj/xcuserdata"
_replace "./SmuckOSX/SmuckOSX.xcodeproj/project.pbxproj"
_mvdir "./SmuckOSX/SmuckOSX.xcodeproj" "./SmuckOSX/$PROJECT_OSX.xcodeproj"

# SmuckOSX
_replace "./SmuckOSX/SmuckOSX/AppDelegate.h"
_replace "./SmuckOSX/SmuckOSX/AppDelegate.m"
_replace "./SmuckOSX/SmuckOSX/Base.lproj/Main.storyboard"
_replace "./SmuckOSX/SmuckOSX/Info.plist"
_replace "./SmuckOSX/SmuckOSX/main.m"
_replace "./SmuckOSX/SmuckOSX/ViewController.h"
_replace "./SmuckOSX/SmuckOSX/ViewController.m"
_mvdir "./SmuckOSX/SmuckOSX" "./SmuckOSX/$PROJECT_OSX"

# SmuckOSXTests
_replace "./SmuckOSX/SmuckOSXTests/Info.plist"
_mvfile "./SmuckOSX/SmuckOSXTests/SmuckOSXTests.m" "./SmuckOSX/SmuckOSXTests/$PROJECT_OSX_TESTS.m"
_mvdir "./SmuckOSX/SmuckOSXTests" "./SmuckOSX/$PROJECT_OSX_TESTS"

# SmuckOSX root
_mvdir "./SmuckOSX" "./$PROJECT_OSX"

################
### SmuckIOS ###
################

# Xcode project
_rmdir "./SmuckIOS/SmuckIOS.xcodeproj/xcuserdata"
_replace "./SmuckIOS/SmuckIOS.xcodeproj/project.pbxproj"
_mvdir "./SmuckIOS/SmuckIOS.xcodeproj" "./SmuckIOS/$PROJECT_IOS.xcodeproj"

# SmuckIOS
_replace "./SmuckIOS/SmuckIOS/AppDelegate.h"
_replace "./SmuckIOS/SmuckIOS/AppDelegate.m"
_replace "./SmuckIOS/SmuckIOS/Base.lproj/Main.storyboard"
_replace "./SmuckIOS/SmuckIOS/Base.lproj/LaunchScreen.xib"
_replace "./SmuckIOS/SmuckIOS/Info.plist"
_replace "./SmuckIOS/SmuckIOS/main.m"
_replace "./SmuckIOS/SmuckIOS/ViewController.h"
_replace "./SmuckIOS/SmuckIOS/ViewController.m"
_mvdir "./SmuckIOS/SmuckIOS" "./SmuckIOS/$PROJECT_IOS"

# SmuckIOSTests
_replace "./SmuckIOS/SmuckIOSTests/Info.plist"
_mvfile "./SmuckIOS/SmuckIOSTests/SmuckIOSTests.m" "./SmuckIOS/SmuckIOSTests/$PROJECT_IOS_TESTS.m"
_mvdir "./SmuckIOS/SmuckIOSTests" "./SmuckIOS/$PROJECT_IOS_TESTS"

# SmuckIOS root
_mvdir "./SmuckIOS" "./$PROJECT_IOS"

echo "Successfully renamed Smuck to $PROJECT_NAME with bundle identifier $BUNDLE_ID and copyright $COPYRIGHT"

