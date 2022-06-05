import 'package:bet_kray/Login/Screen/login_screen.dart';
import 'package:bet_kray/Login/UserRepository/user_repository.dart';
import 'package:bet_kray/Login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

// ignore: use_function_type_syntax_for_parameters
void main() {
  group('Login Page', () {
    testWidgets('finds a title widget using a Key', (tester) async {
      // Define the test key.
      const testKey = Key('title');

      // Build a MaterialApp with the testKey.
      await tester.pumpWidget(BlocProvider(
        create: (_) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
            home: LoginUi(
          key: testKey,
        )),
      ));

      // Find the MaterialApp widget using the testKey.
      expect(find.byKey(testKey), findsWidgets);
    });
    testWidgets('finds a text widget using a Key', (tester) async {
      // Define the test key.
      const testKey = Key('gojjo');

      // Build a MaterialApp with the testKey.
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
            home: LoginUi(
          key: testKey,
        )),
      ));

      // Find the MaterialApp widget using the testKey.
      expect(find.byKey(testKey), findsWidgets);
    });
    testWidgets('finds a Multiple sizedbox widget.', (tester) async {
      // Define the test key.
      const testKey = Key('box');

      // Build a MaterialApp with the testKey.
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
            home: LoginUi(
          key: testKey,
        )),
      ));

      // Find the MaterialApp widget using the testKey.
      expect(find.byKey(testKey), findsWidgets);
    });
    testWidgets('finds hint text.', (tester) async {
      // Define the test key.
      const testKey = Key('email');

      // Build a MaterialApp with the testKey.
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
            home: LoginUi(
          key: testKey,
        )),
      ));

      // Find the MaterialApp widget using the testKey.
      expect(find.text('Enter your email'), findsWidgets);
    });
    testWidgets('finds a Multiple Container widget ', (tester) async {
      // Define the test key.
      const testKey = Key('cont');

      // Build a MaterialApp with the testKey.
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
            home: LoginUi(
          key: testKey,
        )),
      ));

      // Find the MaterialApp widget using the testKey.
      expect(find.byKey(testKey), findsWidgets);
    });
    testWidgets('finds a Multiple Text Field widget ', (tester) async {
      // Define the test key.
      const testKey = Key('email');

      // Build a MaterialApp with the testKey.
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
            home: LoginUi(
          key: testKey,
        )),
      ));

      // Find the MaterialApp widget using the testKey.
      expect(find.byKey(testKey), findsWidgets);
    });
    testWidgets("finds Row Widget ", (tester) async {
      const testKey = Key("row");
      // Build an App with a Text widget that finds by key
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
          home: LoginUi(
            key: testKey,
          ),
        ),
      ));

      expect(find.byKey(testKey), findsWidgets);
    });
    testWidgets("finds a text Widget for to redirect to signup page",
        (tester) async {
      const testKey = Key("newUser");
      // Build an App with a Text widget that finds by key
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
          home: LoginUi(
            key: testKey,
          ),
        ),
      ));

      expect(find.text("Don't have an account?"), findsOneWidget);
    });

    testWidgets("finding a Gesture Detector ", (tester) async {
      const testKey = Key("gesture");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (_) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
          home: LoginUi(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });

   testWidgets("finding a signup button", (tester) async {
      const testKey = Key("signbutton");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
          home: LoginUi(
            key: testKey,
          ),
        ),
      ));

      expect(find.byKey(testKey), findsWidgets);
    });

    testWidgets("finding a signup button", (tester) async {
      const testKey = Key("buttonText");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: const MaterialApp(
          home: LoginUi(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });
  });
}
