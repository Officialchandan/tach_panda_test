import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tach_panda_test/ui/ui_bloc/bloc_event.dart';
import 'package:tach_panda_test/ui/ui_bloc/bloc_state.dart';

class UIBloc extends Bloc<UIEvent, UIState> {
  UIBloc() : super(UIInitialState()) {
    on<SwitchEvent>(
      (event, emit) async {
        return emit(SwitchState(isSwitch: event.isSwitch));
      },
    );
  }
}
