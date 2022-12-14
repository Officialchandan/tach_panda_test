import 'package:equatable/equatable.dart';

abstract class UIState extends Equatable {
  const UIState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UIInitialState extends UIState {
  @override
  List<Object> get props => [];
}

class SwitchState extends UIState {
  final bool isSwitch;
  const SwitchState({required this.isSwitch});
  @override
  List<Object> get props => [isSwitch];
}
