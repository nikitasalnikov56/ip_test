import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/model/auth_model.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/routes/app_routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(BuildContext context, this.router) {
    readDataFromStorage(context);
  }
  final GoRouter router;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  final storage = const FlutterSecureStorage();

//sing in
  Future<void> singIn(
      String login, String password, BuildContext context) async {
    if (loginController.text.toLowerCase().trim() == login &&
        passwordController.text.toLowerCase().trim() == password) {
      router.go(AppRoutes.home);
      await storage
          .write(key: login, value: password)
          .then((value) => controllersClear());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.backgroundColor,
          content: Text(
            'Invalid email or password',
            style: AppStyle.fontStyle,
          ),
        ),
      );
    }
  }

  //clear controllers
  controllersClear() {
    loginController.clear();
    passwordController.clear();
  }

  //read data
  Future<void> readDataFromStorage(BuildContext context) async {
    Map<String, String> allValues = await storage.readAll();

    if (allValues.entries.isNotEmpty &&
        allValues.entries.first.key.isNotEmpty &&
        allValues.entries.first.value.isNotEmpty) {
      router.go(AppRoutes.home);
    } else {
      router.go(AppRoutes.login);
    }
  }

  //logOut
  Future<void> logout() async {
    final authModel = AuthModel();
    await storage
        .delete(key: authModel.login)
        .then((value) => router.go(AppRoutes.login));
  }
}
