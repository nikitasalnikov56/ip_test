import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:provider/provider.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Text(
            'Here you can chat',
            style: AppStyle.fontStyle,
          ),
          Expanded(
            child: Card(
              color: AppColors.white,
              elevation: 0,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: model.messageController,
              decoration: InputDecoration(
                fillColor: AppColors.backgroundColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Message',
                hintStyle: AppStyle.fontStyle.copyWith(
                  fontSize: 14,
                  color: AppColors.grey,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
