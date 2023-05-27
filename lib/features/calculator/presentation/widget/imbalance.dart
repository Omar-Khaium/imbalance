import 'package:calculator/features/calculator/presentation/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/imbalance_bloc.dart';

class ImbalanceWidget extends StatelessWidget {
  const ImbalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImbalanceBloc, ImbalanceState>(
      builder: (context, state) {
        if (state is ImbalanceInitial ||
            state is ImbalanceLongProfit ||
            state is ImbalanceLongLoss ||
            state is ImbalanceShortProfit ||
            state is ImbalanceShortLoss) {
          final double imbalance = (state as ImbalanceInitial).imbalance;
          return InfoCard(
            label: "Imbalance",
            total: imbalance,
          );
        } else {
          return const InfoCard(label: "Imbalance");
        }
      },
    );
  }
}
