import 'package:flutter/material.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle({
    super.key,
    required this.image,
    required this.text,
  });
  final String image, text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/images/usa.png'),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
