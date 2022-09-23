import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tester_extension/widget_tester_extension.dart';

class CounterTestScreen {
	final WidgetTester tester;

	CounterTestScreen(this.tester) {
		tester.printToConsole('✓ Counter Screen Open');
	}

	Future<void> clickIncreaseButton() async {
		final finderClickIncreaseButton = find.byKey(const Key('keyIncrementButton'));
		await tester.pumpAndSettle();
		await tester.pumpUntilFound(finderClickIncreaseButton);
		await tester.tap(finderClickIncreaseButton);
		await tester.pumpAndSettle();
	}

	Future<void> verifyIncreaseNumberIs1() async {
		final finderVerifyIncreaseNumberIs1 = find.text('1');
		await tester.pumpAndSettle();
		await tester.pumpUntilFound(finderVerifyIncreaseNumberIs1);
		expect(finderVerifyIncreaseNumberIs1, findsNWidgets(1));
		await tester.pumpAndSettle();
	}

	Future<void> run() async {
		await clickIncreaseButton();
		await verifyIncreaseNumberIs1();
	}
}
