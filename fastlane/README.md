fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios all_checks
```
fastlane ios all_checks
```
All iOS lanes
### ios run_all_test_ios
```
fastlane ios run_all_test_ios
```
Run all test for iOS modules
### ios coverage_ios
```
fastlane ios coverage_ios
```
Calculate the code coverage for iOS packages
### ios lint
```
fastlane ios lint
```
Lint all files

----

## Mac
### mac all_checks
```
fastlane mac all_checks
```
All macOS lanes
### mac run_all_test_macos
```
fastlane mac run_all_test_macos
```
Run all test for macOS modules
### mac coverage_macos
```
fastlane mac coverage_macos
```
Calculate the code coverage for macOS packages
### mac lint
```
fastlane mac lint
```
Lint all files

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
