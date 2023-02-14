import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'auth/auth_repository.dart';
import 'auth/flow/auth_flow_cubit.dart';
import 'auth/login/bloc/login_bloc.dart';
import 'auth/otp/bloc/otp_bloc.dart';
import 'auth/otp/timer/bloc/timer_bloc.dart';
import 'auth/sign_up/bloc/sign_up_bloc.dart';
import 'core/utils/ticker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Dio dio = Dio();

  @override
  Widget build(final BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (final BuildContext context) => AuthRepository(dio: dio),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TimerBloc>(
            create: (final BuildContext context) => TimerBloc(ticker: const Ticker()),
          ),
          BlocProvider<OtpBloc>(
            create: (final BuildContext context) => OtpBloc(),
          ),
          BlocProvider<SignUpBloc>(
            create: (final BuildContext context) => SignUpBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<AuthFlowCubit>(
            create: (final BuildContext context) => AuthFlowCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<LoginBloc>(
            create: (final BuildContext context) => LoginBloc(
              authRepository: context.read<AuthRepository>(),
              authFlowCubit: context.read<AuthFlowCubit>(),
            ),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
