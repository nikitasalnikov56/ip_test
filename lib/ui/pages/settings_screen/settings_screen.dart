import 'package:flutter/material.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.darkBlue,
          ),
        ),
        title: Text(
          'Settings',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
      ),
    );
  }
}
