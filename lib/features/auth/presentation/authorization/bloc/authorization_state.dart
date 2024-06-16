part of 'authorization_bloc.dart';

abstract class AuthorizationState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class AuthorizationInitial extends AuthorizationState {}

class AuthorizationLoading extends AuthorizationState {}

class AuthorizationSuccess extends AuthorizationState {
  final String token;

  AuthorizationSuccess(this.token);

  @override
  List<Object?> get props => <Object?>[token];
}

class AuthorizationError extends AuthorizationState {
  final AppError appError;

  AuthorizationError(this.appError);

  @override
  List<Object?> get props => <Object?>[appError];
}
