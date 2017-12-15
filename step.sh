#!/bin/bash
set -ex

echo "Logging in to Quamotion Cloud"
QUAMOTION_ACCESS_TOKEN=`curl -s -d "apiKey=$quamotion_api_key" https://cloud.quamotion.mobi/api/login | jq -r '.access_token'`
QUAMOTION_RELATIVE_URL=`curl -s -H "Authorization: Bearer $QUAMOTION_ACCESS_TOKEN" https://cloud.quamotion.mobi/api/project | jq -r '.[0].relativeUrl'`
echo "Connected to the Quamotion project at https://quamotion.mobi$QUAMOTION_RELATIVE_URL"

echo "Uploading $test_package_path"
QUAMOTION_PACKAGE=`curl -s -H "Authorization: Bearer $QUAMOTION_ACCESS_TOKEN" -F files=@$test_package_path https://cloud.quamotion.mobi${QUAMOTION_RELATIVE_URL}api/testPackage`

TEST_PACKAGE_NAME=`echo $QUAMOTION_PACKAGE | jq -r '.[0].name'`
TEST_PACKAGE_VERSION=`echo $QUAMOTION_PACKAGE | jq -r '.[0].version'`
echo "Successfully uploaded $TEST_PACKAGE_NAME $TEST_PACKAGE_VERSION based on $test_package_path"

#
# --- Export Environment Variables for other Steps:
# You can export Environment Variables for other Steps with
# envman, which is automatically installed by `bitrise setup`.
# A very simple example:
# envman add --key EXAMPLE_STEP_OUTPUT --value 'the value you want to share'
# Envman can handle piped inputs, which is useful if the text you want to
# share is complex and you don't want to deal with proper bash escaping:
#  cat file_with_complex_input | envman add --KEY EXAMPLE_STEP_OUTPUT
# You can find more usage examples on envman's GitHub page
#  at: https://github.com/bitrise-io/envman
envman add --key TEST_PACKAGE_NAME --value $TEST_PACKAGE_NAME
envman add --key TEST_PACKAGE_VERSION --value $TEST_PACKAGE_VERSION

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.

exit 0
