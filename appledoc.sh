#!/bin/sh

#  appledoc.sh
#  MFCocoaExtras
#
#  Created by Tristan Leblanc on 14/03/16.
#  Copyright © 2016 Tristan Leblanc. All rights reserved.

#appledoc Xcode script
# Start constants
company="MooseFactory Software";
companyID="com.moosefactory";
companyURL="http://www.moosefactory.eu";
target="iphoneos";
#target="macosx";

outputPath="~/help";
# End constants
/usr/local/bin/appledoc \
--project-name "${PROJECT_NAME}" \
--project-company "${company}" \
--company-id "${companyID}" \
--docset-atom-filename "${company}.atom" \
--docset-feed-url "${companyURL}/${company}/%DOCSETATOMFILENAME" \
--docset-package-url "${companyURL}/${company}/%DOCSETPACKAGEFILENAME" \
--docset-fallback-url "${companyURL}/${company}" \
--output "${outputPath}" \
--publish-docset \
--docset-platform-family "${target}" \
--logformat xcode \
--keep-intermediate-files \
--no-repeat-first-par \
--no-warn-invalid-crossref \
--exit-threshold 2 \
--keep-undocumented-objects \
--keep-undocumented-members \
--logformat xcode \
--merge-categories \
--no-repeat-first-par \
--no-warn-invalid-crossref \
--no-warn-undocumented-object \
--no-warn-undocumented-member \
--no-warn-empty-description \
--output "${outputPath}" \
--install-docset \
--print-information-block-titles \
--use-code-order \
--verbose 4 \
--ignore "*.m" \
--ignore "*.pch" \
--ignore "*.config" \
--ignore "*.xcconfig" \
--ignore "*.docset" \
--ignore "*.xcodeproj" \
--ignore "*.xcworkspace" \
--ignore "*.lock" \
--ignore "*.plist" \
--ignore "*.strings" \
--ignore "*.txt" \
--ignore "*.app" \
--ignore "*.podspec" \
--ignore "*.jnlp" \
--ignore "*.jar" \
--ignore "*.png" \
--ignore "*.jpg" \
--ignore "*.html" \
--ignore "*.xml" \
--ignore "*.sh" \
--ignore "*.gitignore" \
--ignore "Podfile" \
--ignore "ci_build" \
--ignore "LoadableCategory.h" \
--ignore ".idea" \
--ignore "build" \
--ignore "Documentation" \
--ignore "XXXXXX_Unit_Tests" \
--ignore "Jenkins" \
--ignore "Resources" \
--ignore "BuildHeaders" \
--ignore "Igor" \
--ignore "Kiwi" \
--ignore "Local Podspecs" \
--ignore "PublicAutomation" \
--ignore "SDWebImage" \
--ignore "SVProgressHUD" \
--ignore "SVPullToRefresh" \
--ignore "CocoaLumberjack" \
--ignore "Toast" \
--ignore "PonyDebugger" \
--ignore "PonyDebuggerLogger" \
--ignore "SocketRocket" \
"${PROJECT_DIR}"