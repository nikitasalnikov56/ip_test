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
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    print(devicePixelRatio);
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
            child: Column(
              children: [
                ContainerItemsWidget(
                  orientation: orientation,
                  constraints: constraints,
                ),
                const SizedBox(height: 20),
                model.showItems()
                    ? DataWidget(constraints: constraints)
                    : Text(
                        'Select item and press check button',
                        style: AppStyle.fontStyle,
                      ),
              ],
            ),
          );
        });
      } else {
        return LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Row(
              children: [
                ContainerItemsWidget(
                  orientation: orientation,
                  constraints: constraints,
                ),
                const SizedBox(width: 20),
                model.showItems()
                    ? DataWidget(
                        constraints: constraints,
                      )
                    : Text(
                        'Select item and press check button',
                        style: AppStyle.fontStyle.copyWith(
                            fontSize: constraints.isNormalized &&
                                    devicePixelRatio < 2.5
                                ? 12
                                : 16),
                        overflow: TextOverflow.ellipsis,
                      ),
              ],
            ),
          );
        });
      }
    });
  }
}
