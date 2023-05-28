import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/color.dart';
import '../../../../core/text_styles.dart';
import '../../../../dependencies.dart';
import 'form.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final double? alpha;
  final double? beta;
  final double? total;
  final Function(double a, double b)? onChange;
  const InfoCard({
    super.key,
    required this.label,
    this.total,
    this.alpha,
    this.beta,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = dependency<AppColor>();
    return PhysicalModel(
      color: theme.card,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onChange != null
            ? () async {
                final Tuple2<double, double>? params = await showModalBottomSheet(
                  context: context,
                  builder: (_) => Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: FormWidget(
                      title: label,
                      alpha: alpha,
                      beta: beta,
                    ),
                  ),
                  isScrollControlled: true,
                );

                if (params != null && onChange != null) {
                  onChange!(params.item1, params.item2);
                }
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyles.label(context: context, color: theme.label),
              ),
              if (total != null)
                Text(
                  "${total!.isNegative ? "- " : ""}\$${total!.abs().toStringAsFixed(5)}",
                  style: TextStyles.currencyLarge(context: context, color: theme.currency),
                )
              else
                Text(
                  "-",
                  style: TextStyles.currencyLarge(context: context, color: theme.currency),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
