import 'package:shared_preferences/shared_preferences.dart';

import 'pref_keys.dart';

Future<void> setRememberMe(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(PrefKeys.rememberMe, value);
}

Future<bool> getRememberMe() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(PrefKeys.rememberMe) ?? false;
}

Future<void> setEmail(String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(PrefKeys.email, value);
}

Future<String> getEmail() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(PrefKeys.email) ?? '';
}

Future<void> setPassword(String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(PrefKeys.password, value);
}

Future<String> getPassword() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(PrefKeys.password) ?? '';
}

Future<void> removeEmailAndPass() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(PrefKeys.email);
  await prefs.remove(PrefKeys.password);
}

Future<void> setToken(String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(PrefKeys.token, value);
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(PrefKeys.token);
}

Future<void> clearToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(PrefKeys.token);
}
