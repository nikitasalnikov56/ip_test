import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_new_test/domain/model/data.dart';


class DataApi{
  
 static Future<CountriesData> loadCountriesData() async {
  String jsonString = await rootBundle.loadString('assets/json/data.json');
  Map<String, dynamic> jsonData = json.decode(jsonString);
  return CountriesData.fromJson(jsonData);
}
}
