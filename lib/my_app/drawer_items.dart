import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/domain/provider/auth_provider.dart';
import 'package:flutter_new_test/ui/components/photo_edit.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:provider/provider.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  void _showDialog(BuildContext context, AuthProvider authModel) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(
              'Are you sure want to exit app?',
              style: AppStyle.fontStyle,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  authModel.logout();
                },
                child: const Text('Yes'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    final authModel = context.watch<AuthProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PhotoEdit(),
          const Divider(
            color: AppColors.grey,
          ),
          MenuItems(
            icon: Icons.contacts,
            text: 'Contacts',
            func: () {
              model.appbarFunction(context, AppBarButtonsEvent.contacts);
            },
          ),
          MenuItems(
            icon: Icons.message,
            text: 'Messages',
            func: () {
              model.appbarFunction(context, AppBarButtonsEvent.message);
            },
          ),
          MenuItems(
            icon: Icons.add_chart,
            text: 'Charts',
            func: () {
              model.appbarFunction(context, AppBarButtonsEvent.chart);
            },
          ),
          MenuItems(
            icon: Icons.settings,
            text: 'Settings',
            func: () {
              model.appbarFunction(context, AppBarButtonsEvent.settings);
            },
          ),
          MenuItems(
            icon: Icons.logout,
            text: 'Log out',
            func: () {
              _showDialog(context, authModel);
            },
          ),
        ],
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({
    super.key,
    required this.func,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        func();
      },
      leading: Icon(icon),
      title: Text(
        text,
        style: AppStyle.fontStyle,
      ),
    );
  }
}
