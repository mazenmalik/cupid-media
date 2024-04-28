import 'package:cupid_media/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    required super.id,
    required super.value,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json['id'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
      };

  CountryEntity toEntity() => CountryEntity(
        id: id,
        value: value,
      );
}
