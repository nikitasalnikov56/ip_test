import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/model/auth_model.dart';
import 'package:flutter_new_test/domain/provider/auth_provider.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthProvider>();
    final authModel = AuthModel();
    return Scaffold(
      body: ColoredBox(
        color: AppColors.backgroundColor,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoginTextField(
                  hintText: 'Login',
                  controller: model.loginController,
                ),
                const SizedBox(height: 16),
                LoginTextField(
                  hintText: 'Password',
                  controller: model.passwordController,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backgroundColor,
                    ),
                    onPressed: () {
                      model.singIn(authModel.login, authModel.password, context);
                    },
                    child: Text(
                      'Sign In',
                      style: AppStyle.fontStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
      ),
    );
  }
}
