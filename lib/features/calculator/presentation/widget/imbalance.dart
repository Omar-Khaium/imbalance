import '../../../../core/text_styles.dart';
import 'card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/color.dart';
import '../../../../dependencies.dart';
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
          final theme = dependency<AppColor>();
          final double imbalance = (state as ImbalanceInitial).imbalance;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: InfoCard(
                  label: "Imbalance",
                  total: imbalance.isNaN ? null : imbalance,
                ),
              ),
              const SizedBox(height: 16),
              Visibility(
                visible: !imbalance.isNaN,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ActionChip(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      backgroundColor: theme.chip,
                      elevation: 4,
                      shadowColor: theme.chipShadow,
                      padding: const EdgeInsets.all(12),
                      onPressed: () async {
                        final messenger = ScaffoldMessenger.of(context);

                        final String content = "Imbalance: ${imbalance.isNegative ? "- " : ""}\$${imbalance.abs().toStringAsFixed(5)}";

                        await Clipboard.setData(ClipboardData(text: content));
                        messenger.showSnackBar(const SnackBar(content: Text('Copied to your clipboard !')));
                      },
                      avatar: Icon(
                        Icons.copy_all_rounded,
                        color: theme.card,
                      ),
                      label: Text(
                        "Copy",
                        style: TextStyles.chip(context: context, color: theme.card),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ActionChip(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      backgroundColor: theme.reset,
                      elevation: 4,
                      shadowColor: theme.resetShadow,
                      padding: const EdgeInsets.all(12),
                      onPressed: () {
                        context.read<ImbalanceBloc>().add(ImbalanceReset());
                      },
                      avatar: Icon(
                        Icons.restore,
                        color: theme.card,
                      ),
                      label: Text(
                        "Reset",
                        style: TextStyles.chip(context: context, color: theme.card),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const InfoCard(label: "Imbalance");
        }
      },
    );
  }
}
