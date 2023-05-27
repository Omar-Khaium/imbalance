import 'package:calculator/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/color.dart';
import '../../../../dependencies.dart';

class FormWidget extends StatefulWidget {
  final String title;
  final double? alpha;
  final double? beta;
  const FormWidget({
    super.key,
    required this.title,
    this.alpha,
    this.beta,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late final GlobalKey<FormState> validator;

  late final TextEditingController alphaController, betaController;

  @override
  void initState() {
    super.initState();
    alphaController = TextEditingController(
      text: widget.alpha?.toString() ?? "",
    );

    betaController = TextEditingController(
      text: widget.beta?.toString() ?? "",
    );

    validator = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    final theme = dependency<AppColor>();
    return Container(
      color: theme.card,
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: validator,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: TextStyles.button(context: context, color: theme.background),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    controller: alphaController,
                    keyboardType: const TextInputType.numberWithOptions(signed: false),
                    decoration: const InputDecoration(
                      hintText: "required",
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyles.currencyLarge(context: context, color: theme.currency),
                    validator: (value) => value?.isNotEmpty ?? false ? null : "required",
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    controller: betaController,
                    keyboardType: const TextInputType.numberWithOptions(signed: false),
                    decoration: const InputDecoration(
                      hintText: "required",
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyles.currencyLarge(context: context, color: theme.currency),
                    validator: (value) => value?.isNotEmpty ?? false ? null : "required",
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 84,
              child: ElevatedButton(
                onPressed:  () {
                  if (validator.currentState?.validate() ?? false) {
                    final num? a = num.tryParse(alphaController.text);
                    final num? b = num.tryParse(betaController.text);
                    if (a != null && b != null) {
                      Navigator.of(context).pop(Tuple2<double, double>(a.toDouble(), b.toDouble()));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.currencySmall,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text(
                  "Submit".toUpperCase(),
                  style: TextStyles.button(context: context, color: theme.card),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
