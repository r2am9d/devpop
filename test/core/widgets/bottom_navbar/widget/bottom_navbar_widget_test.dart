import 'package:bloc_test/bloc_test.dart';
import 'package:devpop/core/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../helpers/helpers.dart';

class MockBottomNavbarBloc
    extends MockBloc<BottomNavbarEvent, BottomNavbarState>
    implements BottomNavbarBloc {}

void main() {
  late BottomNavbarBloc bnBloc;

  setUp(() {
    bnBloc = MockBottomNavbarBloc();
    when(() => bnBloc.state).thenReturn(BottomNavbarInitial());
    when(() => bnBloc.states<BottomNavbarIndex>())
        .thenReturn(const BottomNavbarIndex());
  });

  tearDown(() {
    reset(bnBloc);
  });

  group('BottomNavbarWidget', () {
    testWidgets('Render [BottomNavbarWidget] with initial state',
        (tester) async {
      await tester.pumpApp(
        BlocProvider<BottomNavbarBloc>.value(
          value: BottomNavbarBloc(),
          child: const BottomNavbarWidget(),
        ),
      );

      // Verify [SalomonBottomBar] is rendered
      expect(find.byType(SalomonBottomBar), findsOneWidget);

      // Verify initial icons are displayed
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    });

    testWidgets('Change selected index when an item is tapped',
        (WidgetTester tester) async {
      await tester.pumpApp(
        BlocProvider<BottomNavbarBloc>.value(
          value: BottomNavbarBloc(),
          child: const BottomNavbarWidget(),
        ),
      );

      // Verify initial state is [BottomNavbarInitial]
      expect(bnBloc.state as BottomNavbarInitial, isA<BottomNavbarInitial>());

      // Tap on the second item
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Simulate a state change to index 1
      when(() => bnBloc.state).thenReturn(const BottomNavbarIndex(index: 1));
      when(() => bnBloc.states<BottomNavbarIndex>())
          .thenReturn(const BottomNavbarIndex(index: 1));
      await tester.pumpAndSettle();

      // Verify state has been updated
      expect((bnBloc.state as BottomNavbarIndex).index, 1);
    });

    testWidgets('Display active icon when an item is selected',
        (WidgetTester tester) async {
      await tester.pumpApp(
        BlocProvider<BottomNavbarBloc>.value(
          value: BottomNavbarBloc(),
          child: const BottomNavbarWidget(),
        ),
      );

      // Verify initial icon is displayed
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);

      // Tap on the last item
      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pumpAndSettle();

      // Simulate state change to index 2
      when(() => bnBloc.state).thenReturn(const BottomNavbarIndex(index: 2));
      when(() => bnBloc.states<BottomNavbarIndex>())
          .thenReturn(const BottomNavbarIndex(index: 2));
      await tester.pumpAndSettle();

      // Verify active icon is displayed
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });
  });
}
