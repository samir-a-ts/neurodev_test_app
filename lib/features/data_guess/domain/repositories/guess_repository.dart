import 'package:neurodev_test_app/features/data_guess/domain/entities/age_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/country_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/gender_guess_data.dart';

abstract class GuessRepository {
  Future<GenderGuessData> guessGender(String name);

  Future<CountryGuessData> guessCountries(String name);

  Future<AgeGuessData> guessAge(String name);
}
