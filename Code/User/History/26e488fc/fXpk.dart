import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../auth/auth_repository.dart';

final GetIt locator = GetIt.instance;

void init() {
  // EXTERNAL
  final Dio _dio = Dio();
  // final authDio = BaseDioClient.auth().dio;
  // final userDio = BaseDioClient.user().dio;
  // final articleDio = BaseDioClient.article().dio;
  // final cloudinaryDio = BaseDioClient.cloudinary().dio;

  // REPOSITORY
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository(dio: _dio));
  locator.registerLazySingleton<StorageRepository>(() => StorageRepository());
  locator.registerLazySingleton<UserRepository>(
    () => UserRepository(userDio: userDio, storageRepo: locator(), cloudinaryDio: cloudinaryDio),
  );
  locator.registerLazySingleton<ArticleRepository>(
    () => ArticleRepository(articleDio: articleDio, storageRepo: locator(), cloudinaryDio: cloudinaryDio),
  );

  // CUBITS
  locator.registerFactory<AuthenticationCubit>(() => AuthenticationCubit(authRepository: locator()));
  locator.registerFactory<SessionNavigatorCubit>(() => SessionNavigatorCubit());

  // BLOCS
  locator.registerFactory<LoginBloc>(() => LoginBloc(authenticationCubit: locator(), authRepository: locator()));
  locator.registerFactory<SignupBloc>(() => SignupBloc(authenticationCubit: locator(), authRepository: locator()));
  locator.registerFactory<AddArticleBloc>(() => AddArticleBloc(
        articleRepo: locator(),
        sessionNavCubit: locator(),
        picker: locator(),
      ));
  locator
      .registerFactory<ProfileBloc>(() => ProfileBloc(storageRepo: locator(), userRepo: locator(), picker: locator()));
  locator.registerFactory<HomeBloc>(() => HomeBloc(articleRepo: locator()));
  locator.registerFactory<EditProfileBloc>(() => EditProfileBloc(
        picker: locator(),
        userRepo: locator(),
      ));
}
