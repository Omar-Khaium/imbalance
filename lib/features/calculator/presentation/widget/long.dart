import 'package:flutter/material.dart';

import 'long_profit.dart';
import 'long_loss.dart';

class LongWidget extends StatelessWidget {
  const LongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: LongProfitWidget(),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: LongLossWidget(),
        ),
      ],
    );
  }
}
