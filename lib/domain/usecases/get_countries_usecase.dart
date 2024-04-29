import 'package:cupid_media/core/error/failure.dart';
import 'package:cupid_media/domain/entities/country_entity.dart';
import 'package:cupid_media/domain/repositories/place_repository.dart';
import 'package:dartz/dartz.dart';

class GetCountryUseCase {
  final PlaceRepository placeRepository;

  GetCountryUseCase(this.placeRepository);

  Future<Either<Failure, List<CountryEntity>>> execute() {
    return placeRepository.getCountries();
  }
}
