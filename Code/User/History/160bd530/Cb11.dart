import 'package:dio/dio.dart';

import 'login/model/login_request_model.dart';
import 'login/model/login_response_model.dart';
import 'sign_up/model/register_request_model.dart';
import 'sign_up/model/register_response_model.dart';

class AuthRepository {
  AuthRepository({required this.dio});
  final Dio dio;

  Future<RegisterResponseModel> signUp(final RegisterRequestModel data) async {
    final Response<Map<String, dynamic>> result =
        await dio.post('http://10.0.2.2:5000/admin/register', data: data.toJson());
    return RegisterResponseModel.fromJson(result.data!);
  }

  Future<LoginResponseModel> login(final LoginRequestModel data) async {
    final Response<Map<String, dynamic>> result =
        await dio.post('http://10.0.2.2:5000/admin/login', data: data.toJson());
    return LoginResponseModel.fromJson(result.data!);
  }

  void logOut() {}

  Future<void> attemptAutoLogin() async {
    final LoginResponseModel user = await login(
      const LoginRequestModel(
        phoneNumber: '',
        password: '',
      ),
    );

    if (user.success == false) {
      throw Exception('Auto login failed');
    }
    return;

    // final user = await storageRepo.getData<Map>('user');
    // if (user.isNotEmpty) {
    //   try {
    //     final credentials = LoginRequestModel(phoneNumber: user.phoneNumber, password: user.password);
    //     await login(credentials);
    //   } catch (e) {
    //     throw Exception(e);
    //   }
    // } else {
    //   throw Exception('User not found');
    // }
  }
}
