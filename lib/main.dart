import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/color.dart';
import 'dependencies.dart' as dependencies;
import 'features/calculator/presentation/bloc/imbalance_bloc.dart';
import 'features/calculator/presentation/page/calculator.dart';

Future<void> main() async {
  await dependencies.inject();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = dependencies.dependency<AppColor>();
    return MaterialApp(
      title: "Imbalance",
      color: theme.background,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => dependencies.dependency<ImbalanceBloc>(),
        child: const CalculatorPage(),
      ),
    );
  }
}
