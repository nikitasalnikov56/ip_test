import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/my_app/active_icon_widget.dart';
import 'package:flutter_new_test/my_app/custom_appbar_widget.dart';
import 'package:flutter_new_test/my_app/drawer_items.dart';
import 'package:flutter_new_test/ui/pages/calls/calls_page.dart';
import 'package:flutter_new_test/ui/pages/contacts/contacts_page.dart';
import 'package:flutter_new_test/ui/pages/home/home_body.dart';
import 'package:flutter_new_test/ui/pages/message/message_page.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_new_test/ui/resources/app_icons.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  static List<Widget> screens = [
    const HomeBody(),
    const CallsPage(),
    const MessagesPage(),
    const ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: AppColors.backgroundColor,
        child: SafeArea(
          child: DrawerItems(),
        ),
      ),
      backgroundColor: AppColors.white,
      appBar: const CustomAppBarWidget(),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: BottomNavigationBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          selectedItemColor: AppColors.darkBlue,
          unselectedItemColor: AppColors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: model.curIndex,
          onTap: (index) {
            model.changScreens(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SvgIcon(icon: SvgIconData(AppIcons.home)),
                  Text(
                    'Home',
                    style: AppStyle.fontStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              label: '',
              activeIcon: const ActiveIconWidget(
                icon: AppIcons.home,
                labeltext: 'Номе',
              ),
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SvgIcon(icon: SvgIconData(AppIcons.phone)),
                  Text(
                    'Calls',
                    style: AppStyle.fontStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              activeIcon: const ActiveIconWidget(
                icon: AppIcons.phone,
                labeltext: 'Calls',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SvgIcon(icon: SvgIconData(AppIcons.message)),
                  Text(
                    'Messages',
                    style: AppStyle.fontStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              activeIcon: ActiveIconWidget(
                model: model,
                icon: AppIcons.message,
                labeltext: 'Messages',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SvgIcon(icon: SvgIconData(AppIcons.user)),
                  Text(
                    'Contacts',
                    style: AppStyle.fontStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              activeIcon: ActiveIconWidget(
                model: model,
                icon: AppIcons.user,
                labeltext: 'Contacts',
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: screens[model.curIndex],
    );
  }
}
