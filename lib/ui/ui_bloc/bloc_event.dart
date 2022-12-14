import 'package:equatable/equatable.dart';

class UIEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SwitchEvent extends UIEvent {
  final bool isSwitch;
  SwitchEvent({required this.isSwitch});
  @override
  List<Object> get props => [isSwitch];
}
