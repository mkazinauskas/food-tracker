// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:foodtracker/main.dart';
import 'package:foodtracker/ui/screens/settings_screen.dart';

void main() {
  testWidgets('Diary is default screen test', (WidgetTester tester) async {
    await tester.pumpWidget(FoodTrackerApp());

    expect(find.text('Diary screen'), findsOneWidget);
  });

  testWidgets('Diary screen exists test', (WidgetTester tester) async {
    await tester.pumpWidget(FoodTrackerApp());

    await tester.tap(find.byIcon(Icons.book));
    await tester.pump();

    expect(find.text('Diary screen'), findsOneWidget);
  });

  testWidgets('Add New screen exists test', (WidgetTester tester) async {
    await tester.pumpWidget(FoodTrackerApp());

    await tester.tap(find.byIcon(Icons.add_circle_outline));
    await tester.pump();

    expect(find.text('Add New screen'), findsOneWidget);
  });
}
