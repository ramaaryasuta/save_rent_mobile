import 'package:flutter/widgets.dart';

import '../../../../core/api/model/response_state.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../../domain/entities/login_param.dart';
import '../../domain/entities/register_param.dart';
import '../../domain/repo/auth_repo.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo _authRepo;

  AuthProvider({AuthRepo? authRepo}) : _authRepo = authRepo ?? AuthRepoImpl();

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<ResponseState> loginUser({
    required String email,
    required String password,
  }) async {
    setLoading(true);
    final param = LoginParam(email: email, password: password);
    final response = await _authRepo.loginUser(param);
    setLoading(false);
    return response;
  }

  Future<ResponseState> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    setLoading(true);
    final param = RegisterParam(name: name, email: email, password: password);
    final response = await _authRepo.registerUser(param);
    setLoading(false);
    return response;
  }
}
