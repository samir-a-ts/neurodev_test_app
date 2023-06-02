import 'package:neurodev_test_app/features/data_guess/domain/entities/base_guess_data.dart';

/// Guessing the gender data.
final class GenderGuessData extends BaseGuessData {
  /// What are the chances of this name
  /// having particular [gender].
  final double probability;

  final Gender gender;

  const GenderGuessData({
    required this.probability,
    required this.gender,
  });

  GenderGuessData.fromMap(Map<String, dynamic> map)
      : probability = map['probability'] as double,
        gender = _parseGender(map['gender'] as String);
}

enum Gender {
  male,
  female,
  attackHelicopter,
}

Gender _parseGender(String gender) {
  switch (gender) {
    case 'male':
      return Gender.male;
    case 'female':
      return Gender.female;
    default:
      return Gender.attackHelicopter;
  }
}
