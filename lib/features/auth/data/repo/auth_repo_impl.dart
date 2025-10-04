import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/api/api_path.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/api/model/response_state.dart';
import '../../../../core/prefs/pref_extension.dart';
import '../../../../core/routing/app_route_path.dart' show AppRoutePath;
import '../../../../utils/print_log.dart';
import '../../domain/entities/login_param.dart';
import '../../domain/entities/register_param.dart';
import '../../domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final apiService = APIService();

  @override
  Future<ResponseState> loginUser(LoginParam loginParam) async {
    try {
      final data = {'email': loginParam.email, 'password': loginParam.password};
      final request = await apiService.postData(
        path: APIPath.login,
        data: data,
      );

      if (request.statusCode == 200) {
        return ResponseState(
          success: true,
          message: request.data?['message'],
          data: request.data,
        );
      } else {
        return ResponseState(
          success: false,
          message: request.data?['message'] ?? 'Unknown error',
        );
      }
    } catch (e) {
      printLog('loginUser error: $e', type: LogType.error);
      return ResponseState(success: false, message: e.toString());
    }
  }

  @override
  Future<ResponseState> registerUser(RegisterParam registerParam) async {
    try {
      final data = {
        'name': registerParam.name,
        'email': registerParam.email,
        'password': registerParam.password,
      };

      final request = await apiService.postData(
        path: APIPath.register,
        data: data,
      );
      if (request.statusCode == 200) {
        return ResponseState(
          success: true,
          message: request.data?['message'],
          data: request.data,
        );
      } else {
        return ResponseState(
          success: false,
          message: request.data?['message'] ?? 'Unknown error',
        );
      }
    } catch (e) {
      printLog('registerUser : $e', type: LogType.error);
      return ResponseState(success: false, message: e.toString());
    }
  }

  @override
  Future<void> logoutUser(BuildContext context) async {
    await clearToken();
    if (context.mounted) {
      context.go(AppRoutePath.loginRoute);
    }
  }
}
