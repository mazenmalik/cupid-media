import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  const StateEntity({
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
