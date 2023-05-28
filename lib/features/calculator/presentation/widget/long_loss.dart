import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/imbalance_bloc.dart';
import 'card.dart';

class LongLossWidget extends StatelessWidget {
  const LongLossWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImbalanceBloc, ImbalanceState>(
      buildWhen: (previous, current) => current is ImbalanceLongLoss || current is ImbalanceDefault,
      builder: (context, state) {
        if (state is ImbalanceLongLoss) {
          return InfoCard(
            label: "Long Loss",
            total: state.total,
            alpha: state.alpha,
            beta: state.beta,
            onChange: (a, b) {
              context.read<ImbalanceBloc>().add(LongLoss(alpha: a, beta: b));
            },
          );
        } else {
          return InfoCard(
            label: "Long Loss",
            onChange: (a, b) {
              context.read<ImbalanceBloc>().add(LongLoss(alpha: a, beta: b));
            },
          );
        }
      },
    );
  }
}
