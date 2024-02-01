import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/model/data.dart';
import 'package:flutter_new_test/ui/components/float_button_widget.dart';
import 'package:flutter_new_test/ui/resources/app_icons.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.countriesData,
    required this.index,
  });

  final CountriesData? countriesData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0,
        color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            var data = countriesData!.countries![index].countyData;
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.white,
                child: SvgIcon(
                  color: AppColors.grey,
                  icon: SvgIconData(
                    AppIcons.phone,
                  ),
                ),
              ),
              title: Text(
                '${data?[i].phone}',
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                '${data?[i].state}',
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 13,
                  color: AppColors.grey,
                ),
              ),
              trailing: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatButtonWidget(
                      func: () {},
                      text: 'S',
                    ),
                    FloatButtonWidget(
                      func: () {},
                      text: 'V',
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, i) => const SizedBox(height: 24),
          itemCount: countriesData!.countries![index].countyData!.length,
        ),
      ),
    );
  }
}
