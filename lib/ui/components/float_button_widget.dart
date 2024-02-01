import 'package:flutter/material.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';

class FloatButtonWidget extends StatelessWidget {
  const FloatButtonWidget({super.key, required this.text, required this.func});
  final String text;
  final Function func;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: AppColors.backgroundColor,
        ),
        onPressed: () {
          func();
        },
        child: Text(
          text,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
