import 'package:cupid_media/data/datasource/data_source.dart';
import 'package:cupid_media/domain/repositories/place_repository.dart';
import 'package:cupid_media/domain/usecases/get_countries_usecase.dart';
import 'package:cupid_media/domain/usecases/get_state_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    PlaceRepository,
    DataSource,
    GetCountryUseCase,
    GetStateUseCase,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
