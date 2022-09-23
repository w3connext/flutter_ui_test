# Documents
# - https://github.com/flutter/flutter/tree/master/packages/integration_test#android-device-testing
# - https://docs.flutter.dev/testing/integration-tests#testing-on-firebase-test-lab

# make test_by_case file=login/login_test.dart
test_by_case:
	flutter test integration_test/$(file) --flavor mock

test_all:
	flutter test integration_test

ios_integration_test:
	flutter test integration_test/counter/counter_test.dart

android_integration_test:
	flutter test integration_test/counter/counter_test.dart

#iOS Device Testing
ios_device_integration_test:
	flutter build ios --config-only integration_test/login/login_test.dart