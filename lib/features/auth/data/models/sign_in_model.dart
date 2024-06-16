import 'package:equatable/equatable.dart';

class SignInModel extends Equatable {
  final String email;
  final String token;

  const SignInModel({required this.email, required this.token});

  Map<String, dynamic> toJson() => {
        'email': email,
        'token': token,
      };

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'],
      token: json['token'],
    );
  }

  @override
  List<Object?> get props => [email, token];
}
