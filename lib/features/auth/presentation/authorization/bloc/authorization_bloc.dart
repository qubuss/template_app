import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:templateapp/core/errors/data/models/app_error.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationInitial()) {
    on<AuthorizationOnLogin>(_onLogin);
  }

  Future<void> _onLogin(AuthorizationOnLogin event, Emitter<AuthorizationState> emit) async {
    emit(AuthorizationLoading());
    try {
      await Future.delayed(const Duration(seconds: 5));
      emit(AuthorizationSuccess('token'));
    } on AppError catch (e) {
      emit(AuthorizationError(e));
    }
  }
}
