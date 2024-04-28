import 'package:cupid_media/domain/entities/state_entity.dart';
import 'package:equatable/equatable.dart';

abstract class StateState extends Equatable {
  const StateState();

  @override
  List<Object?> get props => [];
}

class StateEmpty extends StateState {}

class StateLoading extends StateState {}

class StateLoaded extends StateState {
  final List<StateEntity> result;

  const StateLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class StateLoadFailue extends StateState {
  final String message;

  const StateLoadFailue(this.message);

  @override
  List<Object?> get props => [message];
}
