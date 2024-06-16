part of 'authorization_bloc.dart';

class AuthorizationEvent {
  const AuthorizationEvent();
}

class AuthorizationOnLogin extends AuthorizationEvent {
  final String email;
  final String password;

  const AuthorizationOnLogin({
    required this.email,
    required this.password,
  });
}
