import 'package:cupid_media/core/error/failure.dart';
import 'package:cupid_media/domain/entities/state_entity.dart';
import 'package:cupid_media/domain/repositories/place_repository.dart';
import 'package:dartz/dartz.dart';

class GetStateUseCase {
  final PlaceRepository placeRepository;

  GetStateUseCase(this.placeRepository);

  Future<Either<Failure, List<StateEntity>>> execute(int id) {
    return placeRepository.getStates(id);
  }
}
