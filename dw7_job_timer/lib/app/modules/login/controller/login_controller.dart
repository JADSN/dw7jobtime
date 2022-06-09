// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:dw7_job_timer/app/modules/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(const LoginState.initial());

  Future<void> signIn() async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      await _authService.signIn();
    } on Exception catch (e, s) {
      log("[ERROR]: Error ao realizar login", error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: LoginStatus.failure,
            errorMessage: 'Error ao realizar login'),
      );
    }
  }
}
