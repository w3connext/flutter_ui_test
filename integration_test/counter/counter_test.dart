import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_test/integration_test/main_integration.dart' as app;
import 'package:flutter_ui_test/main.dart';
import 'package:integration_test/integration_test.dart';

import 'counter_test_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Should terms pages then accept button and confirm button',
    (tester) async {
      app.main(
        home: const MyHomePage(title: 'Flutter UI Test'),
      );

      // Counter Screen
      await CounterTestScreen(tester).run();
    },
  );
}
