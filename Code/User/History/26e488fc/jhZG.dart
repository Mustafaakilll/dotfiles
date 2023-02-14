import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../auth/auth_repository.dart';
import '../../auth/flow/auth_flow_cubit.dart';
import '../../auth/login/bloc/login_bloc.dart';
import '../../auth/otp/bloc/otp_bloc.dart';
import '../../auth/otp/timer/bloc/timer_bloc.dart';
import '../../auth/sign_up/bloc/sign_up_bloc.dart';
import '../../session_navigator/bloc/session_navigator_cubit.dart';
import '../utils/ticker.dart';

final GetIt locator = GetIt.instance;

void init() {
  // EXTERNAL
  final Dio dio = Dio();
  const Ticker ticker = Ticker();
  // final authDio = BaseDioClient.auth().dio;
  // final userDio = BaseDioClient.user().dio;
  // final articleDio = BaseDioClient.article().dio;
  // final cloudinaryDio = BaseDioClient.cloudinary().dio;

  // REPOSITORY
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository(dio: dio));

  // CUBITS
  locator.registerFactory<AuthFlowCubit>(() => AuthFlowCubit(authRepository: locator()));
  locator.registerFactory<SessionNavigatorCubit>(() => SessionNavigatorCubit());

  // BLOCS
  locator.registerFactory<LoginBloc>(
    () => LoginBloc(authFlowCubit: locator<AuthFlowCubit>(), authRepository: locator<AuthRepository>()),
  );
  locator.registerFactory<SignUpBloc>(() => SignUpBloc(authRepository: locator<AuthRepository>()));
  locator.registerFactory<TimerBloc>(() => TimerBloc(ticker: ticker));
  locator.registerFactory<OtpBloc>(() => OtpBloc());
}
