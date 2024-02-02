import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/model/data.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/components/item_title.dart';
import 'package:flutter_new_test/ui/pages/home/card_widget.dart';
import 'package:provider/provider.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.watch<AppProvider>().setUp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error Loading Data'),
            );
          } else if (snapshot.hasData) {
            return CountriesList(countriesData: snapshot.data, constraints: constraints,);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

class CountriesList extends StatelessWidget {
  const CountriesList({super.key, required this.countriesData, required this.constraints});
  final CountriesData? countriesData;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, i) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTitle(
              image: 'assets/images/usa.png',
              text: '${countriesData?.countries?[i].country}',
            ),
            const SizedBox(height: 19),
            CardWidget(
              countriesData: countriesData,
              index: i,
              constraints: constraints,
            ),
          ],
        );
      },
      separatorBuilder: (context, i) => const SizedBox(height: 25),
      itemCount: countriesData!.countries!.length,
    ));
  }
}
