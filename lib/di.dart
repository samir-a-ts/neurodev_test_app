import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neurodev_test_app/core/data/interceptors.dart';
import 'package:neurodev_test_app/features/data_guess/data/repositories/guess_repository.dart';
import 'package:neurodev_test_app/features/data_guess/domain/repositories/guess_repository.dart';
import 'package:neurodev_test_app/features/data_guess/presentation/state/input_data/input_data_cubit.dart';

final getIt = GetIt.instance;

void initialize() {
  final dio = Dio();

  dio.interceptors.add(ErrorInterceptor());

  getIt.registerSingleton<GuessRepository>(
    GuessRepositoryImpl(dio),
  );

  getIt.registerFactory(
    () => InputDataCubit(
      getIt(),
    ),
  );
}
