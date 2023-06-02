import 'package:neurodev_test_app/features/data_guess/domain/entities/base_guess_data.dart';

final class AgeGuessData extends BaseGuessData {
  final int age;

  const AgeGuessData({
    required this.age,
  });

  AgeGuessData.fromMap(Map<String, dynamic> map) : age = map['age'] as int;
}
