import 'package:flutter/material.dart';
import 'package:neurodev_test_app/core/presentation/gap.dart';
import 'package:neurodev_test_app/features/data_guess/domain/entities/base_guess_data.dart';
import 'package:neurodev_test_app/features/data_guess/presentation/widgets/guess_widget.dart';

class GuessResultPage extends StatelessWidget {
  final List<BaseGuessData> data;

  const GuessResultPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Результаты"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: data.length,
        itemBuilder: (context, index) => GuessWidget(
          data: data[index],
        ),
        separatorBuilder: (context, index) => const Gap(gap: 20),
      ),
    );
  }
}
