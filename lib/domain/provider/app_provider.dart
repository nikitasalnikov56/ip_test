import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/api/data_api.dart';
import 'package:flutter_new_test/domain/model/data.dart';
import 'package:flutter_new_test/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

enum AppBarButtonsEvent {
  chart,
  message,
  notification,
  contacts,
  settings,
  logout
}

class AppProvider extends ChangeNotifier {
  AppProvider();

  final messageController = TextEditingController();


  

  

  //AppBarButtons function

  void appbarFunction(BuildContext context, AppBarButtonsEvent event) {
    switch (event) {
      case AppBarButtonsEvent.chart:
        context.go(AppRoutes.chart);
        break;
      case AppBarButtonsEvent.message:
        Scaffold.of(context).closeDrawer();
        curIndex = 2;
        notifyListeners();
        break;
      case AppBarButtonsEvent.contacts:
        Scaffold.of(context).closeDrawer();
        curIndex = 3;
        notifyListeners();
        break;
      case AppBarButtonsEvent.settings:
        Scaffold.of(context).closeDrawer();
        context.go(AppRoutes.settings);
        break;
      case AppBarButtonsEvent.logout:
        context.go(AppRoutes.settings);
        break;

      default:
        break;
    }
  }

  CountriesData? countriesData;
  //main function in future builder

  Future<CountriesData?> setUp() async {
    countriesData = await DataApi.loadCountriesData();
    return countriesData;
  }

  int curIndex = 0;
  changScreens(int index) {
    curIndex = index;
    notifyListeners();
  }

  //tabs
  List<String> str = [
    'SMS',
    'MMS',
    'Voice',
  ];
  int thisIndex = 0;
  tabsIndex(int key) {
    thisIndex = key;
    notifyListeners();
  }

  //dropdown items
  final List<String> items = [
    'Landline or Mobile',
    'Landline',
    'Mobile',
  ];
  String? selectedValue;
  changeValue(String? val) {
    selectedValue = val;
    notifyListeners();
  }

  //checkbox
  bool isChecked = false;

  checkValue(bool? val) {
    isChecked = val ?? false;
    notifyListeners();
  }

  //show items
  bool showItems() {
    if (isChecked && selectedValue == items.first) {
      return true;
    } else {
      return false;
    }
  }

  //pick image
  File? imageFile;
  final imagePicker = ImagePicker();
  String path = '';

  Future imagePickerMethod(BuildContext context) async {
    final pick = await imagePicker.pickImage(source: ImageSource.camera);

    if (pick != null) {
      path = pick.path;

      imageFile = File(path);
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(
          'No file selected', const Duration(milliseconds: 500), context);
    }
    notifyListeners();
  }

  showSnackBar(String snackText, Duration duration, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
