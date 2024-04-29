import 'package:bloc_test/bloc_test.dart';
import 'package:cupid_media/core/error/failure.dart';
import 'package:cupid_media/domain/entities/state_entity.dart';
import 'package:cupid_media/presentation/bloc/state/state_bloc.dart';
import 'package:cupid_media/presentation/bloc/state/state_event.dart';
import 'package:cupid_media/presentation/bloc/state/state_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MockGetStateUseCase mockGetStateUseCase;
  late StateBloc stateBloc;

  setUp(() {
    mockGetStateUseCase = MockGetStateUseCase();
    stateBloc = StateBloc(mockGetStateUseCase);
  });

  const testStates = [
    StateEntity(
      id: 1,
      value: 'Manila',
    ),
    StateEntity(
      id: 2,
      value: 'Paranaque',
    ),
  ];

  test('initial state should be empty', () {
    expect(stateBloc.state, StateEmpty());
  });

  blocTest<StateBloc, StateState>(
      'should emit [StateLoading, StateLoaded] when data is gotten successfully',
      build: () {
        when(mockGetStateUseCase.execute(5)).thenAnswer(
            (_) async => const Right<Failure, List<StateEntity>>(testStates));
        return stateBloc;
      },
      act: (bloc) => bloc.add(const OnGetState(5)),
      wait: const Duration(milliseconds: 500),
      expect: () => [StateLoading(), const StateLoaded(testStates)]);

  blocTest<StateBloc, StateState>(
      'should emit [StateLoading, StateLoading] when get data is unsuccessful',
      build: () {
        when(mockGetStateUseCase.execute(5)).thenAnswer(
            (_) async => const Left(ServerFailure('Server failure')));
        return stateBloc;
      },
      act: (bloc) => bloc.add(const OnGetState(5)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            StateLoading(),
            const StateLoadFailue('Server failure'),
          ]);
}
