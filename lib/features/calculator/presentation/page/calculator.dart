import 'package:flutter/material.dart';

import '../../../../core/color.dart';
import '../../../../core/text_styles.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              const LongWidget(),
              const SizedBox(height: 16),
              const ShortWidget(),
              const SizedBox(height: 16),
              const ImbalanceWidget(),
              const SizedBox(height: 16),
              Text(
                "v1.0.3",
                style: TextStyles.chip(context: context, color: theme.card),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
