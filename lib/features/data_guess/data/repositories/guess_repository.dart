import 'package:dio/dio.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/age_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/country_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/gender_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/domain/repositories/guess_repository.dart';

class GuessRepositoryImpl extends GuessRepository {
  final Dio _dio;

  GuessRepositoryImpl(this._dio);

  @override
  Future<AgeGuessData> guessAge(String name) async {
    final request = await _dio.get(
      'https://api.agify.io/',
      queryParameters: {
        'name': name,
      },
    );

    return AgeGuessData.fromMap(request.data);
  }

  @override
  Future<CountryGuessData> guessCountries(String name) async {
    final request = await _dio.get(
      'https://api.nationalize.io/',
      queryParameters: {
        'name': name,
      },
    );

    return CountryGuessData.fromMap(request.data);
  }

  @override
  Future<GenderGuessData> guessGender(String name) async {
    final request = await _dio.get(
      'https://api.genderize.io/',
      queryParameters: {
        'name': name,
      },
    );

    return GenderGuessData.fromMap(request.data);
  }
}
