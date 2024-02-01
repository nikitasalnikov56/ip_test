import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class ActiveIconWidget extends StatelessWidget {
  const ActiveIconWidget({
    super.key,
    required this.icon,
    required this.labeltext,
    this.model,
  });

  final AppProvider? model;
  final String labeltext;
  final String icon;

  BoxConstraints maxWidth() {
    if (model?.curIndex == 2 || model?.curIndex == 3) {
      return const BoxConstraints(maxWidth: 150);
    } else {
      return const BoxConstraints(maxWidth: 95);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      constraints: maxWidth(),
      decoration: BoxDecoration(
          color: AppColors.lime, borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgIcon(icon: SvgIconData(icon)),
          const SizedBox(width: 4),
          Text(
            labeltext,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
