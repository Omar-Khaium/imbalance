import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/imbalance_bloc.dart';
import 'card.dart';

class LongProfitWidget extends StatelessWidget {
  const LongProfitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImbalanceBloc, ImbalanceState>(
      buildWhen: (previous, current) => current is ImbalanceLongProfit || current is ImbalanceDefault,
      builder: (context, state) {
        if (state is ImbalanceLongProfit) {
          return InfoCard(
            label: "Long Profit",
            total: state.total,
            alpha: state.alpha,
            beta: state.beta,
            onChange: (a, b) {
              context.read<ImbalanceBloc>().add(LongProfit(alpha: a, beta: b));
            },
          );
        } else {
          return InfoCard(
            label: "Long Profit",
            onChange: (a, b) {
              context.read<ImbalanceBloc>().add(LongProfit(alpha: a, beta: b));
            },
          );
        }
      },
    );
  }
}
