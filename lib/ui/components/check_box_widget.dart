import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:provider/provider.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lime,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Hero(
            tag: 'checkbtn',
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              side: BorderSide.none,
              fillColor: MaterialStateProperty.all(AppColors.lime),
              checkColor: AppColors.darkBlue,
              value: model.isChecked,
              onChanged: (value) {
                model.checkValue(value);
              },
            ),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'Show number without verification',
          style: AppStyle.fontStyle
              .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
