import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurodev_test_app/di.dart';
import 'package:neurodev_test_app/features/data_guess/presentation/pages/input_data_page.dart';
import 'package:neurodev_test_app/features/data_guess/presentation/state/input_data/input_data_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InputDataCubit>(
      create: (context) => getIt(),
      child: const MaterialApp(
        title: 'Data guess from name',
        home: InputDataPage(),
      ),
    );
  }
}
