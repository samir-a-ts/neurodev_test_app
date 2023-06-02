part of 'input_data_cubit.dart';

class InputDataState extends Equatable {
  final String name;

  final ErrorCode? errorCode;

  final bool isLoading;

  final List<BaseGuessData>? guessData;

  const InputDataState({
    this.name = '',
    this.errorCode,
    this.isLoading = false,
    this.guessData,
  });

  @override
  List<Object?> get props => [name, errorCode, isLoading];

  InputDataState copyWith({
    String? name,
    ErrorCode? errorCode,
    bool? isLoading,
    List<BaseGuessData>? guessData,
  }) {
    return InputDataState(
      name: name ?? this.name,
      errorCode: errorCode ?? this.errorCode,
      isLoading: isLoading ?? this.isLoading,
      guessData: guessData,
    );
  }
}
