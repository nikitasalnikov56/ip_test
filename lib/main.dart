import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_new_test/my_app/my_app.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}
