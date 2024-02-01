import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/resources/app_images.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:provider/provider.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: AppBar(
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset(
            AppImages.menu,
            width: 20,
          ),
        ),
        title: Text(
          '+12021234567',
          style: AppStyle.fontStyle,
        ),
        actions: [
          Hero(
            tag: 'chart',
            child: GestureDetector(
              
              onTap: () {
                model.appbarFunction(context, AppBarButtonsEvent.chart);
              },
              child: SizedBox(
                width: 40,
                child: Image.asset(
                  AppImages.chart,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              model.appbarFunction(context, AppBarButtonsEvent.message);
            },
            child: SizedBox(
              width: 40,
              child: Image.asset(
                AppImages.message,
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 40,
              child: Image.asset(
                AppImages.notification,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 75);
}
