import 'package:flutter/material.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';

abstract class AppStyle {
  static TextStyle fontStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.darkBlue,
    fontFamily: 'Roboto',
  );
}
