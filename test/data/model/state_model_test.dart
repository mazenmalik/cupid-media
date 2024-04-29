import 'dart:convert';
import 'package:cupid_media/data/models/state_model.dart';
import 'package:cupid_media/domain/entities/state_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/json_reader.dart';

void main() {
  const testStateModel = StateModel(id: 13, value: 'Manila');

  test('should be a subclass of state entity', () async {
    //assert
    expect(testStateModel, isA<StateEntity>());
  });

  test('should return a valid model from json', () async {
    //arrange
    final List jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_state_response.json'),
    );

    //act

    final result = jsonMap.map((e) => StateModel.fromJson(e)).toList();

    //assert
    expect(result[0], equals(testStateModel));
  });

  test(
    'should return a json map containing proper data',
    () async {
      // act
      final result = testStateModel.toJson();

      // assert
      final expectedJsonMap = {'id': 13, 'value': 'Manila'};

      expect(result, equals(expectedJsonMap));
    },
  );
}
