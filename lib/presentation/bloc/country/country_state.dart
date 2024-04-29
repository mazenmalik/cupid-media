import 'package:cupid_media/domain/entities/country_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object?> get props => [];
}

class CountryEmpty extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<CountryEntity> result;

  const CountryLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class CountryLoadFailue extends CountryState {
  final String message;

  const CountryLoadFailue(this.message);

  @override
  List<Object?> get props => [message];
}
