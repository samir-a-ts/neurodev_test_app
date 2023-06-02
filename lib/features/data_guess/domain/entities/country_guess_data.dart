import 'package:neurodev_test_app/features/data_guess/domain/entities/base_guess_data.dart';

final class CountryGuessData extends BaseGuessData {
  final List<CountryPossibilityData> countries;

  const CountryGuessData({
    required this.countries,
  });

  CountryGuessData.fromMap(Map<String, dynamic> map)
      : countries = (map['country'] as List)
            .map(
              (e) => CountryPossibilityData.fromMap(e as Map<String, dynamic>),
            )
            .toList();
}

class CountryPossibilityData {
  final String countryId;

  final double probability;

  const CountryPossibilityData({
    required this.countryId,
    required this.probability,
  });

  CountryPossibilityData.fromMap(Map<String, dynamic> map)
      : countryId = map['country_id'] as String,
        probability = map['probability'] as double;
}
