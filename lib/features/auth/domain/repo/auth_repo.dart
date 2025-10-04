import 'package:flutter/material.dart';

import '../../../../core/api/model/response_state.dart';
import '../entities/login_param.dart';
import '../entities/register_param.dart';

abstract class AuthRepo {
  Future<ResponseState> loginUser(LoginParam loginParam);
  Future<ResponseState> registerUser(RegisterParam registerParam);
  Future<void> logoutUser(BuildContext context);
}
