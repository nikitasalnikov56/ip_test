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
    required this.orientation,
    required this.constraints,
  });
  final Orientation orientation;
  final BoxConstraints constraints;

  List<Widget> rowItems(AppProvider model) {
    return model.str
        .asMap()
        .entries
        .map(
          (entry) => GestureDetector(
            onTap: () {
              model.tabsIndex(entry.key);
            },
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.isNormalized) {
                return Container(
                  decoration: BoxDecoration(
                    color: model.thisIndex == entry.key
                        ? AppColors.lime
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    entry.value,
                    style: AppStyle.fontStyle.copyWith(
                      fontSize: 13,
                      color: model.thisIndex == entry.key
                          ? AppColors.darkBlue
                          : AppColors.grey,
                    ),
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: model.thisIndex == entry.key
                        ? AppColors.lime
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  child: Text(
                    entry.value,
                    style: AppStyle.fontStyle.copyWith(
                      fontSize: 13,
                      color: model.thisIndex == entry.key
                          ? AppColors.darkBlue
                          : AppColors.grey,
                    ),
                  ),
                );
              }
            }),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Container(
      width: orientation == Orientation.landscape && constraints.isNormalized
          ? MediaQuery.of(context).size.width / 2
          : double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal:
            constraints.maxWidth >= 480 && devicePixelRatio == 1.5 ? 5 : 16,
        vertical:
            constraints.maxWidth >= 480 && devicePixelRatio == 1.5 ? 5 : 17,
      ),
      margin: EdgeInsets.only(
          bottom: orientation == Orientation.landscape && devicePixelRatio > 1.5
              ? 15
              : 0),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(constraints.isNormalized ? 10 : 25),
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
