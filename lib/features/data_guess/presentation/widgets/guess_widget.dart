import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:neurodev_test_app/core/presentation/gap.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/age_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/base_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/country_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/gender_guess_data.dart';

class GuessWidget extends StatelessWidget {
  final BaseGuessData data;

  const GuessWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    if (data is GenderGuessData) {
      return _GenderGuessWidget(
        data: data as GenderGuessData,
      );
    }

    if (data is AgeGuessData) {
      return _AgeGuessWidget(
        data: data as AgeGuessData,
      );
    }

    if (data is CountryGuessData) {
      return _CountryGuessWidget(
        data: data as CountryGuessData,
      );
    }

    return const SizedBox();
  }
}

class _GenderGuessWidget extends StatelessWidget {
  final GenderGuessData data;

  const _GenderGuessWidget({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Гендер:',
              style: theme.textTheme.headlineMedium,
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  switch (data.gender) {
                    Gender.male => '👨',
                    Gender.female => '👩',
                    Gender.attackHelicopter => '🚁',
                  },
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  '${data.probability * 100}%',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AgeGuessWidget extends StatelessWidget {
  final AgeGuessData data;

  const _AgeGuessWidget({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Возраст:',
              style: theme.textTheme.headlineMedium,
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  switch (data.age) {
                    < 6 => '👶',
                    < 14 => '👦',
                    < 45 => '👨',
                    _ => '👴',
                  },
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  data.age.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CountryGuessWidget extends StatelessWidget {
  final CountryGuessData data;

  const _CountryGuessWidget({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Национальность:',
              style: theme.textTheme.headlineMedium,
            ),
            const Gap(),
            for (final country in data.countries) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: theme.shadowColor.withOpacity(.25),
                        ),
                      ],
                    ),
                    child: Flag.fromString(
                      country.countryId,
                      height: 50,
                      width: 75,
                    ),
                  ),
                  Text(
                    '${(country.probability * 100).toStringAsFixed(1)}%',
                    style: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
              const Gap(),
            ],
          ],
        ),
      ),
    );
  }
}
