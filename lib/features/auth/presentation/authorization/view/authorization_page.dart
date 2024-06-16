import 'package:flutter/material.dart';
import 'package:templateapp/features/auth/presentation/authorization/view/widgets/auth_box.dart';
import 'package:templateapp/features/auth/presentation/authorization/view/widgets/welcome_box.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const WelcomeBox(),
          AuthBox(),
        ],
      )),
    );
  }
}
