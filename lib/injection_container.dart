import 'package:cupid_media/data/datasource/data_source.dart';
import 'package:cupid_media/data/repositories/place_repository_impl.dart';
import 'package:cupid_media/domain/repositories/place_repository.dart';
import 'package:cupid_media/domain/usecases/get_countries_usecase.dart';
import 'package:cupid_media/domain/usecases/get_state_usecase.dart';
import 'package:cupid_media/presentation/bloc/country/country_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => CountryBloc(locator()));
  // usecase
  locator.registerLazySingleton(() => GetCountryUseCase(locator()));
  locator.registerLazySingleton(() => GetStateUseCase(locator()));
  // repository
  locator.registerLazySingleton<PlaceRepository>(
    () => PlaceRepositoryImpl(dataSource: locator()),
  );

  // data source
  locator.registerLazySingleton<DataSource>(
    () => DataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
