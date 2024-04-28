import 'package:cupid_media/domain/entities/country_entity.dart';
import 'package:cupid_media/domain/usecases/get_countries_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCountryUseCase getCountryUseCase;
  late MockPlaceRepository mockPlaceRepository;

  setUp(() {
    mockPlaceRepository = MockPlaceRepository();
    getCountryUseCase = GetCountryUseCase(mockPlaceRepository);
  });

  const testCountryList = [
    CountryEntity(id: 1, value: 'Philippines'),
    CountryEntity(id: 1, value: 'Philippines'),
    CountryEntity(id: 1, value: 'Philippines')
  ];

  test('should get country list from the repository', () async {
    // arrange
    when(mockPlaceRepository.getCountries())
        .thenAnswer((_) async => const Right(testCountryList));

    // act
    final result = await getCountryUseCase.execute();

    // assert
    expect(result, const Right(testCountryList));
  });
}
