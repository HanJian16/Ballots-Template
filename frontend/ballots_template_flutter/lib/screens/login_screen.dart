import 'package:ballots_template_flutter/widgets/auth/loginBackground/login_background.dart';
import 'package:ballots_template_flutter/widgets/auth/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        child: LoginBody(),
      ),
    );
  }
}
