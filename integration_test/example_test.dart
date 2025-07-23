import 'dart:io';

import 'package:devpop/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'renders ShellWidget',
    (tester) async {
      // Replace later with your app's main widget
      await tester.pumpWidgetAndSettle(const App());
      expect(tester('Home Page'), findsOneWidget);

      if (!Platform.isMacOS) {
        await tester.native.pressHome();
      }
    },
  );
}
