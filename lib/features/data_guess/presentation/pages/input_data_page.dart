import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurodev_test_app/core/domain/error_code.dart';
import 'package:neurodev_test_app/core/presentation/gap.dart';
import 'package:neurodev_test_app/features/data_guess/presentation/pages/guess_result_page.dart';
import 'package:neurodev_test_app/features/data_guess/presentation/state/input_data/input_data_cubit.dart';

class InputDataPage extends StatefulWidget {
  const InputDataPage({super.key});

  @override
  State<InputDataPage> createState() => _InputDataPageState();
}

class _InputDataPageState extends State<InputDataPage> {
  final _controller = TextEditingController();

  void _listen() {
    BlocProvider.of<InputDataCubit>(context).mutate(
      name: _controller.text,
    );
  }

  @override
  void initState() {
    _controller.addListener(_listen);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _controller.removeListener(_listen);

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocListener<InputDataCubit, InputDataState>(
        listener: (context, state) {
          final errorCode = state.errorCode;
          if (errorCode != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: theme.colorScheme.error,
                content: Text(errorCode.translate()),
              ),
            );

            return;
          }

          final result = state.guessData;

          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GuessResultPage(
                  data: result,
                ),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Хотите угадаем ваш возраст, пол и национальность?",
                  style: theme.textTheme.headlineMedium,
                  textAlign: TextAlign.start,
                ),
                const Gap(gap: 25),
                Text(
                  "Тогда введите имя (или уходите)",
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const Gap(gap: 50),
                BlocBuilder<InputDataCubit, InputDataState>(
                  buildWhen: (previous, current) => previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    return TextField(
                      controller: _controller,
                      enabled: !state.isLoading,
                      decoration: const InputDecoration(
                        labelText: "Ваше имя",
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                      ],
                    );
                  },
                ),
                const Gap(gap: 30),
                FilledButton(
                  onPressed: () {
                    BlocProvider.of<InputDataCubit>(context).sendRequest();
                  },
                  child: const Text("Угадать"),
                ),
                const Gap(gap: 20),
                BlocBuilder<InputDataCubit, InputDataState>(
                  buildWhen: (previous, current) => previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    if (state.isLoading) return const CircularProgressIndicator.adaptive();

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
