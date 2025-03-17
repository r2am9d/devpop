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

    test('Should verify initial state is [BottomNavbarInitial]', () {
      expect(bnBloc.state, isA<BottomNavbarInitial>());
    });

    blocTest<BottomNavbarBloc, BottomNavbarState>(
      'Should emit [BottomNavbarIndex] when [BottomNavbarSetIndex] is called',
      build: () => bnBloc,
      act: (bloc) => bloc.add(const BottomNavbarSetIndex(index: 1)),
      expect: () => [const BottomNavbarIndex(index: 1)],
    );
  });
}
