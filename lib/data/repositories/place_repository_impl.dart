import 'dart:io';
import 'package:cupid_media/core/error/exception.dart';
import 'package:cupid_media/core/error/failure.dart';
import 'package:cupid_media/data/datasource/data_source.dart';
import 'package:cupid_media/domain/entities/country_entity.dart';
import 'package:cupid_media/domain/entities/state_entity.dart';
import 'package:cupid_media/domain/repositories/place_repository.dart';
import 'package:dartz/dartz.dart';

class PlaceRepositoryImpl extends PlaceRepository {
  final DataSource dataSource;
  PlaceRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CountryEntity>>> getCountries() async {
    try {
      final result = await dataSource.getCountry();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<StateEntity>>> getStates(int id) async {
    try {
      final result = await dataSource.getState(id: id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
