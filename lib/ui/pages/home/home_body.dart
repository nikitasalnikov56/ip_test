import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/components/container_items_widget.dart';
import 'package:flutter_new_test/ui/pages/home/data_widget.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
      child: Column(
        children: [
          const ContainerItemsWidget(),
          const SizedBox(height: 20),
          model.showItems()
              ? const DataWidget()
              : Text(
                  'Select item and press check button',
                  style: AppStyle.fontStyle,
                ),
        ],
      ),
    );
  }
}
