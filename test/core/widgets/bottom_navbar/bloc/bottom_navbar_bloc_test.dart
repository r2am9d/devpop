import 'package:bloc_test/bloc_test.dart';
import 'package:devpop/core/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BottomNavbarBloc', () {
    late BottomNavbarBloc bnBloc;

    setUp(() {
      bnBloc = BottomNavbarBloc();
    });

    tearDown(() {
      bnBloc.close();
    });

    // Initial state test
    test('emits [BottomNavbarInitial] as initial state', () {
      expect(bnBloc.state, isA<BottomNavbarInitial>());
    });

    // [BottomNavbarSetIndex] event test
    blocTest<BottomNavbarBloc, BottomNavbarState>(
      'emits [BottomNavbarIndex] when [BottomNavbarSetIndex] is called',
      build: () => bnBloc,
      act: (bloc) => bloc.add(const BottomNavbarSetIndex(index: 1)),
      expect: () => [
        isA<BottomNavbarIndex>().having((state) => state.index, 'index', 1),
      ],
    );

    // Multiple event test
    blocTest<BottomNavbarBloc, BottomNavbarState>(
      'emits [BottomNavbarIndex] with correct indexes for multiple event',
      build: () => bnBloc,
      act: (bloc) {
        bloc
          ..add(const BottomNavbarSetIndex(index: 0))
          ..add(const BottomNavbarSetIndex(index: 1))
          ..add(const BottomNavbarSetIndex(index: 2));
      },
      expect: () => [
        isA<BottomNavbarIndex>().having((state) => state.index, 'index', 0),
        isA<BottomNavbarIndex>().having((state) => state.index, 'index', 1),
        isA<BottomNavbarIndex>().having((state) => state.index, 'index', 2),
      ],
    );
  });
}
