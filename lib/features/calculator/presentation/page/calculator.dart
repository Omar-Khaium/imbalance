import 'package:flutter/material.dart';

import '../../../../core/color.dart';
import '../../../../dependencies.dart';
import '../widget/imbalance.dart';
import '../widget/long.dart';
import '../widget/short.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = dependency<AppColor>();
    return Scaffold(
      backgroundColor: theme.background,
      body: Padding(
        padding: MediaQuery.of(context).viewPadding.copyWith(left: 12, right: 12),
        child: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LongWidget(),
              SizedBox(height: 16),
              ShortWidget(),
              SizedBox(height: 16),
              ImbalanceWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
