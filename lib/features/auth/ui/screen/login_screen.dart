import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../components/button/filled_button.dart';
import '../../../../components/snackbar.dart';
import '../../../../components/text_field/form_text_field.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/prefs/pref_extension.dart';
import '../../../../core/routing/app_route_path.dart';
import '../../../../utils/validator.dart';
import '../provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obsecure = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getPrefsLogin();
    });
  }

  getPrefsLogin() async {
    bool rememberMe = await getRememberMe();
    if (rememberMe) {
      String email = await getEmail();
      String password = await getPassword();
      _emailController.text = email;
      _passwordController.text = password;
      setState(() {
        _rememberMe = rememberMe;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void validateForm() async {
    if (_formKey.currentState!.validate()) {
      final req = await context.read<AuthProvider>().loginUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (!mounted) return;
      if (req.success) {
        setToken(req.data?['payload']);

        if (_rememberMe) {
          await Future.wait([
            setRememberMe(_rememberMe),
            setEmail(_emailController.text),
            setPassword(_passwordController.text),
          ]);
        }

        if (mounted) {
          showSnackbar(
            context: context,
            message: 'Login Berhasil',
            type: SnackbarType.success,
          );
          // context.go(AppRoutePath.homeRoute);
        }
      } else {
        showSnackbar(
          context: context,
          message: 'Login Gagal',
          type: SnackbarType.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SaveRent', style: context.titleMediumTextStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    MTextFormField(
                      controller: _emailController,
                      hintText: 'Email',
                      validator: validateEmail,
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    MTextFormField(
                      controller: _passwordController,
                      hintText: 'Kata Sandi',
                      validator: validatePassword,
                      obscureText: _obsecure,
                      prefixIcon: const Icon(Icons.key_rounded),
                      suffixIconWidth: 50,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _obsecure = !_obsecure;
                            });
                          },
                          child: Icon(
                            _obsecure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    visualDensity: VisualDensity.compact,
                    value: _rememberMe,
                    onChanged: (v) {
                      setState(() {
                        _rememberMe = v!;
                      });
                    },
                  ),
                  Text('Ingat Saya', style: context.bodyMediumTextStyle),
                ],
              ),
              Consumer<AuthProvider>(
                builder: (context, authP, child) {
                  return Column(
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: MFilledButton(
                          onPressed: authP.isLoading
                              ? null
                              : () {
                                  validateForm();
                                },
                          borderRadius: 10,
                          icon: authP.isLoading
                              ? const CupertinoActivityIndicator()
                              : null,
                          child: const Text('Masuk'),
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          text: 'Belum punya akun? ',
                          style: context.bodyMediumTextStyle,
                          children: [
                            TextSpan(
                              text: 'Daftar',
                              style: context.bodyMediumTextStyle!.copyWith(
                                color: authP.isLoading
                                    ? Colors.grey
                                    : context.primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = authP.isLoading
                                    ? null
                                    : () {
                                        context.push(
                                          AppRoutePath.registerRoute,
                                        );
                                      },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
