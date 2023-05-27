import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/imbalance_bloc.dart';
import 'card.dart';

class ShortLossWidget extends StatelessWidget {
  const ShortLossWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImbalanceBloc, ImbalanceState>(
      buildWhen: (previous, current) => current is ImbalanceShortLoss,
      builder: (context, state) {
        if (state is ImbalanceShortLoss) {
          return InfoCard(
            label: "Short Loss",
            total: state.total,
            alpha: state.alpha,
            beta: state.beta,
            onChange: (a, b) {
              context.read<ImbalanceBloc>().add(ShortLoss(alpha: a, beta: b));
            },
          );
        } else {
          return InfoCard(
            label: "Short Loss",
            onChange: (a, b) {
              context.read<ImbalanceBloc>().add(ShortLoss(alpha: a, beta: b));
            },
          );
        }
      },
    );
  }
}
