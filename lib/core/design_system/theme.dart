import 'package:flutter/material.dart';
import 'package:mobile_assessment/core/constants.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      fontFamily: AppConstants.primaryTypeface,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      fontFamily: AppConstants.primaryTypeface,
    );
  }
}
