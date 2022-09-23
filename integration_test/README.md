# UI Test

## An introduction to integration testing

https://docs.flutter.dev/cookbook/testing/integration/introduction

### 1. Add the integration_test dependency

```yaml
dev_dependencies:
  integration_test:
    sdk: flutter
  flutter_test:
    sdk: flutter
```

### 2. Create the test files

```shell
wec_app/
  lib/
    main.dart
  integration_test/
    app_test.dart
```

### 3. Write the integration test

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();

          // Verify the counter starts at 0.
          expect(find.text('0'), findsOneWidget);

          // Finds the floating action button to tap on.
          final Finder fab = find.byTooltip('Increment');

          // Emulate a tap on the floating action button.
          await tester.tap(fab);

          // Trigger a frame.
          await tester.pumpAndSettle();

          // Verify the counter increments by 1.
          expect(find.text('1'), findsOneWidget);
        });
  });
}
```

### 4. Run the integration test in root project

```shell
flutter test integration_test/app_test.dart
```

Or, you can specify the directory to run all integration tests:

```shell
flutter test integration_test
```

## Page Object Model Pattern

- counter_test_screen.dart

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:wec_app/integration_test/test_screen.dart';
import 'package:wec_app/integration_test/widget_tester.dart';

class CounterTestScreen extends TestScreen {
  final WidgetTester tester;

  final _fab = find.byTooltip('Increment');

  CounterTestScreen(this.tester) {
    tester.printToConsole('✓ Counter Screen Open');
  }

  Future<void> verifyCounterStartsAt0() async {
    await tester.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);
  }

  Future<void> tapCounterButton() async {
    await tester.tap(_fab);
    await tester.pumpAndSettle();
  }

  Future<void> verifyCounterIncrementBy1() async {
    expect(find.text('1'), findsOneWidget);
  }

  @override
  Future<void> run() async {
    await verifyCounterStartsAt0();
    await tapCounterButton();
    await verifyCounterIncrementBy1();
  }
}
```

- counter_test.dart

```dart
import 'package:wec_app/main_integration.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
      'tap on the floating action button, verify counter',
          (tester) async {
        app.main();

        // Counter Screen
        await CounterTestScreen(tester).run();
      },
    );
  });
}
```