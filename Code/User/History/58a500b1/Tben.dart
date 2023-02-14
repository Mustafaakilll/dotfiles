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
import 'core/di/injector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Dio dio = Dio();

  @override
  Widget build(final BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (final _) => locator<AuthRepository>()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TimerBloc>(create: (final _) => locator<TimerBloc>()),
          BlocProvider<OtpBloc>(create: (final _) => locator<OtpBloc>()),
          BlocProvider<SignUpBloc>(create: (final _) => locator<SignUpBloc>()),
          BlocProvider<AuthFlowCubit>(create: (final _) => locator<AuthFlowCubit>()),
          BlocProvider<LoginBloc>(create: (final _) => locator<LoginBloc>()),
        ],
        child: const App(),
      ),
    );
  }
}
