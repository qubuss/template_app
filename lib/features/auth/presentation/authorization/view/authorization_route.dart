import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:templateapp/features/auth/presentation/authorization/bloc/authorization_bloc.dart';
import 'package:templateapp/features/auth/presentation/authorization/view/authorization_page.dart';

class AuthorizationRoute extends StatelessWidget {
  const AuthorizationRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationBloc(),
      child: const AuthorizationPage(),
    );
  }
}
