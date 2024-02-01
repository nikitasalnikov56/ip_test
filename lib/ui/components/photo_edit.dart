import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:provider/provider.dart';

class PhotoEdit extends StatelessWidget {
  const PhotoEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            model.imageFile == null
                ? GestureDetector(
                    onTap: () {
                      model.imagePickerMethod(context);
                    },
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/no_image.png'),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      model.imagePickerMethod(context);
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(
                        model.imageFile!,
                      ),
                    ),
                  ),
          ],
        ),
        const SizedBox(width: 50),
        Expanded(
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              'User name',
              style: AppStyle.fontStyle,
            ),
            subtitle: Text(
              'User last Name',
              style: AppStyle.fontStyle,
            ),
          ),
        ),
      ],
    );
  }
}
