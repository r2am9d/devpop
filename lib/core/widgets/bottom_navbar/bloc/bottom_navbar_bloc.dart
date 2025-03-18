import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:devpop/core/mixins/multi_state_mixin.dart';
import 'package:devpop/core/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState>
    with MultiStateMixin<BottomNavbarEvent, BottomNavbarState> {
  BottomNavbarBloc() : super(BottomNavbarInitial()) {
    // Event handler
    on<BottomNavbarSetIndex>(
      _setIndex,
      transformer: sequential(),
    );

    // Hold state
    holdState(() => const BottomNavbarIndex());
  }

  FutureOr<void> _setIndex(
    BottomNavbarSetIndex event,
    Emitter<BottomNavbarState> emit,
  ) async {
    try {
      emit(BottomNavbarIndex(index: event.index));
    } catch (e, trace) {
      AppLog.e(e.toString(), error: e, trace: trace); // coverage:ignore-line
    }
  }
}
