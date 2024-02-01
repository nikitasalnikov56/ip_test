import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/components/check_box_widget.dart';
import 'package:flutter_new_test/ui/components/dropdown_menu.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:provider/provider.dart';

class ContainerItemsWidget extends StatelessWidget {
  const ContainerItemsWidget({
    super.key,
  });

  List<Widget> rowItems(AppProvider model) {
    return model.str
        .asMap()
        .entries
        .map(
          (entry) => GestureDetector(
            onTap: () {
              model.tabsIndex(entry.key);
            },
            child: Container(
              decoration: BoxDecoration(
                color: model.thisIndex == entry.key
                    ? AppColors.lime
                    : AppColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: Text(
                entry.value,
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 13,
                  color: model.thisIndex == entry.key
                      ? AppColors.darkBlue
                      : AppColors.grey,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowItems(model),
            ),
          ),
          const SizedBox(height: 16),
          const DropDownMenu(),
          const SizedBox(height: 8),
          const CheckBoxWidget(),
        ],
      ),
    );
  }
}
