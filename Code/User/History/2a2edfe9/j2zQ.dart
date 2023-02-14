import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth_repository.dart';

part 'auth_flow_cubit.freezed.dart';
part 'auth_flow_state.dart';

class AuthFlowCubit extends Cubit<AuthFlowState> {
  AuthFlowCubit({required this.authRepository}) : super(const AuthFlowState.unknown()) {
    attemptAutoLogin();
  }

  final AuthRepository authRepository;

  Future<void> attemptAutoLogin() async {
    try {
      await authRepository.attemptAutoLogin();
      emit(const AuthFlowState.authenticated());
    } catch (e) {
      emit(const AuthFlowState.unauthenticated());
    }
  }

  void showLogin() {
    emit(const AuthFlowState.unauthenticated());
  }

  void showHome() {
    emit(const AuthFlowState.authenticated());
  }

  void logOut() {
    authRepository.logOut();
    emit(const AuthFlowState.unauthenticated());
  }

  void showSignUp() {
    emit(const AuthFlowState.unauthenticated());
  }
}
