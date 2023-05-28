import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/imbalance_bloc.dart';
import 'card.dart';

class ShortProfitWidget extends StatelessWidget {
  const ShortProfitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImbalanceBloc, ImbalanceState>(
      buildWhen: (previous, current) => current is ImbalanceShortProfit || current is ImbalanceDefault,
      builder: (context, state) {
        if (state is ImbalanceShortProfit) {
          return InfoCard(
            label: "Short Profit",
            total: state.total,
            alpha: state.alpha,
            beta: state.beta,
            onChange: (a, b) {
              context.read<ImbalanceBloc>().add(ShortProfit(alpha: a, beta: b));
            },
          );
        } else {
          return InfoCard(
            label: "Short Profit",
            onChange: (a, b) {
              context.read<ImbalanceBloc>().add(ShortProfit(alpha: a, beta: b));
            },
          );
        }
      },
    );
  }
}
