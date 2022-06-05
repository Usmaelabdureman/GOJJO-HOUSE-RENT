import 'package:bet_kray/User/screens/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
// import 'package:gojjoapp/screens/profile.dart';
// import 'package:gojjoapp/screens/user_profile.dart';
void main(){
  group('Profile Page', () {
 testWidgets("finding a widget by type", (tester) async {
      // const testKey = Key("padding");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.byType(AppBar),findsOneWidget);
    });

  testWidgets("finding a signup button", (tester) async {
      // const testKey = Key("row");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.text("Your profile"),findsOneWidget);
    });

    testWidgets("finding a signup button", (tester) async {
      // const testKey = Key("avatar");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.byType(CircleAvatar),findsOneWidget);
    });

    testWidgets("finding a widget by type", (tester) async {
      
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.byType(SizedBox),findsWidgets);
    });

    testWidgets("finding a widget by type", (tester) async {
      
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.byType(Column),findsWidgets);
    });

    testWidgets("finding a signup button", (tester) async {
      const testKey = Key("fullname");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.byKey(testKey),findsOneWidget);
    });

    testWidgets("finding a signup button", (tester) async {
      // const testKey = Key("fullname");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.byType(SizedBox),findsWidgets);
    });

    testWidgets("finding a signup button", (tester) async {
      // const testKey = Key("fullname");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.byType(ListTile),findsWidgets);
    });

    testWidgets("finding a signup button", (tester) async {
      const testKey = Key("icons");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.byKey(testKey),findsOneWidget);
    });

    testWidgets("finding a signup button", (tester) async {
      const testKey = Key("edit");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(const MaterialApp(
        home: AdminProfile(),
      ));
      expect(find.byKey(testKey),findsOneWidget);
    });

  });

}
