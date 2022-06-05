// import 'package:bet_kray/Request/Screens/add_request.dart';
import 'package:bet_kray/Request/Screens/add_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group("Request Form test ", () {
    testWidgets("finds textformfield widgets.", (WidgetTester tester) async {
      // const testKey = Key("textform");
      await tester.pumpWidget(MaterialApp(
        home: AddRequest(),
      ));
      expect(find.text("Add new Request"), findsOneWidget);
    });

    testWidgets("finds multiple container widgets.",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: AddRequest(),
      ));
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets("finds Text widgets.", (WidgetTester tester) async {
      const testKey = Key("bedroom");
      await tester.pumpWidget(MaterialApp(
        home: AddRequest(
          key: testKey,
        ),
      ));
      expect(find.text('bedroom number'), findsWidgets);
    });

    testWidgets("finds Gesture Detector widgets.", (WidgetTester tester) async {
      // const testKey = Key("textform");
      await tester.pumpWidget(MaterialApp(
        home: AddRequest(
            // key: testKey,
            ),
      ));
      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets("finds singleChildScrollView Widget by type",
        (WidgetTester tester) async {
      // const testKey = Key("single");
      await tester.pumpWidget(MaterialApp(
        home: AddRequest(),
      ));
      expect(find.byType(SingleChildScrollView), findsWidgets);
    });

    testWidgets("finds Form widgets.", (WidgetTester tester) async {
      const testKey = Key("formKey");
      await tester.pumpWidget(MaterialApp(
        home: AddRequest(
          key: testKey,
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });
  });
}