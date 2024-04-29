import 'dart:io';
import 'package:cupid_media/core/error/exception.dart';
import 'package:cupid_media/core/error/failure.dart';
import 'package:cupid_media/data/models/country_model.dart';
import 'package:cupid_media/data/models/state_model.dart';
import 'package:cupid_media/data/repositories/place_repository_impl.dart';
import 'package:cupid_media/domain/entities/country_entity.dart';
import 'package:cupid_media/domain/entities/state_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockDataSource mockDataSource;
  late PlaceRepositoryImpl placeRepositoryImpl;

  setUp(() {
    mockDataSource = MockDataSource();
    placeRepositoryImpl = PlaceRepositoryImpl(
      dataSource: mockDataSource,
    );
  });

  const testCountryModel = [
    CountryModel(
      id: 1,
      value: 'Philippines',
    ),
    CountryModel(
      id: 1,
      value: 'Philippines',
    ),
  ];

  const testStateModel = [
    StateModel(
      id: 1,
      value: 'Makati',
    ),
    StateModel(
      id: 1,
      value: 'Makati',
    ),
  ];

  group('getCountry', () {
    test(
      'should return list of countries when a call to data source is successful',
      () async {
        // arrange
        when(mockDataSource.getCountry())
            .thenAnswer((_) async => testCountryModel);

        // act
        final result = await placeRepositoryImpl.getCountries();

        // assert
        expect(
            result,
            equals(
                const Right<Failure, List<CountryEntity>>(testCountryModel)));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockDataSource.getCountry()).thenThrow(ServerException());

        // act
        final result = await placeRepositoryImpl.getCountries();

        // assert
        expect(
            result, equals(const Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockDataSource.getCountry()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await placeRepositoryImpl.getCountries();

        // assert
        expect(
            result,
            equals(const Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });

  group('getState', () {
    test(
      'should return list of states when a call to data source is successful',
      () async {
        // arrange
        when(mockDataSource.getState(id: 5))
            .thenAnswer((_) async => testStateModel);

        // act
        final result = await placeRepositoryImpl.getStates(5);

        // assert
        expect(result,
            equals(const Right<Failure, List<StateEntity>>(testStateModel)));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockDataSource.getState(id: 5)).thenThrow(ServerException());

        // act
        final result = await placeRepositoryImpl.getStates(5);

        // assert
        expect(
            result, equals(const Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockDataSource.getCountry()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await placeRepositoryImpl.getCountries();

        // assert
        expect(
            result,
            equals(const Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });
}
