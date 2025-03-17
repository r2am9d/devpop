import 'package:devpop/app.dart';
import 'package:devpop/core/widgets/shell/shell.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders ShellWidget', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(ShellWidget), findsOneWidget);
    });
  });
}
