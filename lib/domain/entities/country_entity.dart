import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  const CountryEntity({
    required this.id,
    required this.value,
  });

  final int id;
  final String value;

  @override
  List<Object?> get props => [id, value];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
    };
  }
}
