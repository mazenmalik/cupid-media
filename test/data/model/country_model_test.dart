import 'dart:convert';
import 'package:cupid_media/data/models/country_model.dart';
import 'package:cupid_media/domain/entities/country_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/json_reader.dart';

void main() {
  const testCountryModel = CountryModel(id: 1, value: 'Philippines');

  test('should be a subclass of country entity', () async {
    //assert
    expect(testCountryModel, isA<CountryEntity>());
  });

  test('should return a valid model from json', () async {
    //arrange
    final List jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_country_response.json'),
    );

    //act

    final result = jsonMap.map((e) => CountryModel.fromJson(e)).toList();

    //assert
    expect(result[0], equals(testCountryModel));
  });

  test(
    'should return a json map containing proper data',
    () async {
      // act
      final result = testCountryModel.toJson();

      // assert
      final expectedJsonMap = {'id': 1, 'value': 'Philippines'};

      expect(result, equals(expectedJsonMap));
    },
  );
}
