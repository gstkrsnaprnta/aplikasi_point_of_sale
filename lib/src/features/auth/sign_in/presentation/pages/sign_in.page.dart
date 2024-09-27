import 'package:aplikasi_point_of_sale/src/core/commons/widgets/elevated_button.widget.dart';
import 'package:aplikasi_point_of_sale/src/core/commons/widgets/space_widget.dart';
import 'package:aplikasi_point_of_sale/src/core/commons/widgets/text_field.widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/assets.gen.dart';
import '../../../../../main/navigation/page/navigation.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SpaceHeight(130.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65.0),
              child: Image.asset(
                Assets.images.logo.path,
                width: 100,
                height: 100,
              )),
          const SpaceHeight(60.0),
          CustomTextField(
            controller: usernameController,
            label: 'Username',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(32.0),
          Button.filled(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                ),
              );
            },
            label: 'Masuk',
          ),
        ],
      ),
    );
  }
}
