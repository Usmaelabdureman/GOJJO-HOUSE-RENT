import 'package:bet_kray/common/widget/drawer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
// import 'package:gojjoapp/screens/home.dart';

void main() {
  group('Profile Page', () {

    testWidgets("finding a drawer widget by type", (WidgetTester tester) async {
      // const testKey = Key("user");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AppDrawer(),
      ));
      expect(find.byType(Drawer),findsOneWidget);
    });

    testWidgets("finding an icon widget by type", (WidgetTester tester) async {
      // const testKey = Key("user");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AppDrawer(),
      ));
      expect(find.byType(Icon),findsWidgets);
    });


 testWidgets("finding a text by key", (WidgetTester tester) async {
      const testKey = Key("user");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AppDrawer(
          key: testKey,
        ),
      ));
      expect(find.byKey(testKey),findsWidgets);
    });

    testWidgets("finding a sizedbox widget by type", (WidgetTester tester) async {
      // const testKey = Key("user");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AppDrawer(),
      ));
      expect(find.byType(SizedBox),findsWidgets);
    });

    testWidgets("finding an icon widget by key", (WidgetTester tester) async {
      const testKey = Key("icons");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AppDrawer(),
      ));
      expect(find.byKey(testKey),findsOneWidget);
    });

    testWidgets("finding a column widget by type", (WidgetTester tester) async {
      // const testKey = Key("icons");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AppDrawer(),
      ));
      expect(find.byType(Column),findsWidgets);
    });

    testWidgets("finding a ListTile widget by type", (WidgetTester tester) async {
      // const testKey = Key("icons");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AppDrawer(),
      ));
      expect(find.byType(ListTile),findsWidgets);
    });

    testWidgets("finding a listile widget by type", (WidgetTester tester) async {
      
      await tester.pumpWidget(const MaterialApp(
        home: AppDrawer(),
      ));
      expect(find.byType(ListTile),findsWidgets);
    });

     testWidgets("finding a row widget by type", (WidgetTester tester) async {
      
      await tester.pumpWidget(const MaterialApp(
        home: AppDrawer(),
      ));
      expect(find.byType(Row),findsWidgets);
    });


  });
}