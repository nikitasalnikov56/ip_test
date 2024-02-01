import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:provider/provider.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Hero(
        tag: 'dropdown',
        child: DropdownButton(
          icon: Transform.rotate(
            alignment: Alignment.center,
            origin: const Offset(0, -3),
            angle: -3.14 / 2,
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: AppColors.grey,
            ),
          ),
          borderRadius: BorderRadius.circular(15),
          isExpanded: true,
          underline: const Divider(
            color: Colors.transparent,
          ),
          hint: Text(
            'Select Item',
            style: AppStyle.fontStyle,
          ),
          items: model.items
              .map(
                (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              )
              .toList(),
          value: model.selectedValue,
          onChanged: (String? value) {
            model.changeValue(value);
          },
        ),
      ),
    );
  }
}
