import 'package:flutter/material.dart';

import 'short_loss.dart';
import 'short_profit.dart';

class ShortWidget extends StatelessWidget {
  const ShortWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: ShortProfitWidget(),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: ShortLossWidget(),
        ),
      ],
    );
  }
}
