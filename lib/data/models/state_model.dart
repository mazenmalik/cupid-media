import 'package:cupid_media/domain/entities/state_entity.dart';

class StateModel extends StateEntity {
  const StateModel({
    required super.id,
    required super.value,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json['id'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
      };

  StateEntity toEntity() => StateEntity(
        id: id,
        value: value,
      );
}
