import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';

import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:provider/provider.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  void _showDialog(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(
              'Are you sure want to call this number',
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
                  Navigator.pop(context);
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
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        left: 16,
        right: 16,
      ),
      child: Card(
        color: AppColors.backgroundColor,
        child: ListView.builder(
          itemBuilder: (context, i) {
            return ListTile(
              onTap: () {
                _showDialog(context);
              },
              title: Text(
                model.countriesData?.countries?[i].countyData?[i].state ?? '',
                style: AppStyle.fontStyle,
              ),
              subtitle: Text(
                '${model.countriesData?.countries?[i].countyData?[i].phone ?? ''} ',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.grey, fontSize: 13),
              ),
              trailing: const Icon(
                Icons.phone,
                color: AppColors.grey,
              ),
            );
          },
          itemCount: model.countriesData?.countries?.length ?? 0,
        ),
      ),
    );
  }
}
