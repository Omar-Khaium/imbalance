import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle label({required BuildContext context, required Color color}) {
    return GoogleFonts.sansita(
      textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
    );
  }

  static TextStyle currencySmall({required BuildContext context, required Color color}) {
    return GoogleFonts.sansita(
      textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w200,
          ),
    );
  }

  static TextStyle currencyLarge({required BuildContext context, required Color color}) {
    return GoogleFonts.sansita(
      textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  static TextStyle button({required BuildContext context, required Color color}) {
    return GoogleFonts.nunitoSans(
      textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
