import 'package:equatable/equatable.dart';

abstract class StateEvent extends Equatable {
  const StateEvent();

  @override
  List<Object?> get props => [];
}

class OnGetState extends StateEvent {
  final int id;
  const OnGetState(this.id);
}
