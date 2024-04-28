import 'package:bloc_test/bloc_test.dart';
import 'package:cupid_media/core/error/failure.dart';
import 'package:cupid_media/domain/entities/country_entity.dart';
import 'package:cupid_media/presentation/bloc/country/country_bloc.dart';
import 'package:cupid_media/presentation/bloc/country/country_event.dart';
import 'package:cupid_media/presentation/bloc/country/country_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetCountryUseCase mockGetCountryUseCase;
  late CountryBloc countryBloc;

  setUp(() {
    mockGetCountryUseCase = MockGetCountryUseCase();
    countryBloc = CountryBloc(mockGetCountryUseCase);
  });

  const testCountry = [
    CountryEntity(
      id: 1,
      value: 'Philippines',
    ),
    CountryEntity(
      id: 1,
      value: 'Philippines',
    ),
  ];

  test('initial state should be empty', () {
    expect(countryBloc.state, CountryEmpty());
  });

  blocTest<CountryBloc, CountryState>(
      'should emit [CountryLoading, CountryLoaded] when data is gotten successfully',
      build: () {
        when(mockGetCountryUseCase.execute()).thenAnswer((_) async =>
            const Right<Failure, List<CountryEntity>>(testCountry));
        return countryBloc;
      },
      act: (bloc) => bloc.add(const OnGetCountry()),
      wait: const Duration(milliseconds: 500),
      expect: () => [CountryLoading(), const CountryLoaded(testCountry)]);

  blocTest<CountryBloc, CountryState>(
      'should emit [CountryLoading, CountryLoaded] when get data is unsuccessful',
      build: () {
        when(mockGetCountryUseCase.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server failure')));
        return countryBloc;
      },
      act: (bloc) => bloc.add(const OnGetCountry()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            CountryLoading(),
            const CountryLoadFailue('Server failure'),
          ]);
}
