import 'package:cupid_media/domain/usecases/get_countries_usecase.dart';
import 'package:cupid_media/presentation/bloc/country/country_event.dart';
import 'package:cupid_media/presentation/bloc/country/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountryUseCase _getCountryUseCase;
  CountryBloc(this._getCountryUseCase) : super(CountryEmpty()) {
    on<OnGetCountry>(
      (event, emit) async {
        emit(CountryLoading());
        final result = await _getCountryUseCase.execute();
        result.fold(
          (failure) {
            emit(CountryLoadFailue(failure.message));
          },
          (data) {
            emit(CountryLoaded(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
