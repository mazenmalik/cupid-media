import 'package:cupid_media/domain/usecases/get_state_usecase.dart';
import 'package:cupid_media/presentation/bloc/state/state_event.dart';
import 'package:cupid_media/presentation/bloc/state/state_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class StateBloc extends Bloc<StateEvent, StateState> {
  final GetStateUseCase _getStateUseCase;
  StateBloc(this._getStateUseCase) : super(StateEmpty()) {
    on<OnGetState>(
      (event, emit) async {
        emit(StateLoading());
        final result = await _getStateUseCase.execute(event.id);
        result.fold(
          (failure) {
            emit(StateLoadFailue(failure.message));
          },
          (data) {
            emit(StateLoaded(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 100)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
