import 'package:cupid_media/domain/entities/state_entity.dart';
import 'package:cupid_media/domain/usecases/get_state_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetStateUseCase getStateUseCase;
  late MockPlaceRepository mockPlaceRepository;

  setUp(() {
    mockPlaceRepository = MockPlaceRepository();
    getStateUseCase = GetStateUseCase(mockPlaceRepository);
  });

  const testStateList = [
    StateEntity(id: 1, value: 'Manila'),
    StateEntity(id: 1, value: 'Paranaque'),
    StateEntity(id: 1, value: 'Makati')
  ];

  const testCountryId = 5;

  test('should get list of states detail from the repository', () async {
    // arrange
    when(mockPlaceRepository.getStates(testCountryId))
        .thenAnswer((_) async => const Right(testStateList));

    // act
    final result = await getStateUseCase.execute(testCountryId);

    // assert
    expect(result, const Right(testStateList));
  });
}
