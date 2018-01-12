# Publish test package to Quamotion Cloud

You can use this Bitrise step to publish a test package for Android and iOS apps, such as Maven or Pester tests,
to [Quamotion Cloud](https://cloud.quamotion.mobi).

You can then execute the tests in this test package on any Android or iOS device hosted in [Quamotion Cloud](https://cloud.quamotion.mobi)

## What this step does

This step publishes your Android or iOS tests to Quamotion Cloud.

Once you've published your app to Quamotion Cloud, you can test your app on various Android and iOS devices hosted by Quamotion.

This step takes two parameters:
- Your Quamotion API key
- The path to test package you want to publish

## See also

This step is part of a series of Bitrise steps which integrate Quamotion Cloud with Bitrise.

* Use the [Publish app to Quamotion Cloud](https://github.com/quamotion/bitrise-step-publish-app-to-quamotion-cloud) step
  to publish your iOS or Android app to [Quamotion Cloud](https://cloud.quamotion.mobi).
* Use the [Publish test package to Quamotion Cloud](https://github.com/quamotion/bitrise-step-publish-test-package-to-quamotion-cloud/)
  step to publish your Maven or Pester tests to [Quamotion Cloud](https://cloud.quamotion.mobi).
* Use the [Start Mobile UI Test in Quamotion Cloud](https://github.com/quamotion/bitrise-step-start-mobile-ui-test-in-quamotion-cloud)
  step to test your iOS or Android app in [Quamotion Cloud](https://cloud.quamotion.mobi).

## Adding this step to your Bitrise workflow
To use this step, follow these steps:

1. Open your workflow in Bitrise
2. Click on the `bitrise.yml` tab in the upper-right corner of your screen
3. Copy and paste the following code in your Bitrise workflow to add this step:

```
- git::https://github.com/quamotion/bitrise-step-publish-test-package-to-quamotion-cloud@master:
    title: Publish test package to Quamotion
    inputs:
    - quamotion_api_key: _YOUR_API_KEY_
    - test_package_path: _YOUR_TEST_PACKAGE_
```

4. Save your workflow by clicking __CTRL + S__


