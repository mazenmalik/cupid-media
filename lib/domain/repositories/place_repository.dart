import 'package:cupid_media/core/error/failure.dart';
import 'package:cupid_media/domain/entities/country_entity.dart';
import 'package:cupid_media/domain/entities/state_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PlaceRepository {
  Future<Either<Failure, List<CountryEntity>>> getCountries();
  Future<Either<Failure, List<StateEntity>>> getStates(int id);
}
