import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:neurodev_test_app/core/domain/error_code.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/base_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/domain/repositories/guess_repository.dart';

part 'input_data_state.dart';

class InputDataCubit extends Cubit<InputDataState> {
  final GuessRepository _guessRepository;

  InputDataCubit(this._guessRepository)
      : super(
          const InputDataState(),
        );

  void mutate({
    String? name,
  }) {
    emit(
      state.copyWith(
        name: name,
        errorCode: null,
        guessData: null,
      ),
    );
  }

  Future<void> sendRequest() async {
    emit(
      state.copyWith(
        errorCode: null,
      ),
    );

    if (state.name.isEmpty) {
      return emit(
        state.copyWith(
          errorCode: ErrorCode.nameIsEmpty,
        ),
      );
    }

    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    try {
      final name = state.name;

      final results = await Future.wait([
        _guessRepository.guessAge(name),
        _guessRepository.guessCountries(name),
        _guessRepository.guessGender(name),
      ]);

      emit(
        state.copyWith(
          guessData: results,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorCode: e is DioError ? e.error as ErrorCode : ErrorCode.unkownError,
          isLoading: false,
        ),
      );
    }
  }
}
