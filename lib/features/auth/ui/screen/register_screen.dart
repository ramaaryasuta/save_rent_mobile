import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../components/button/filled_button.dart';
import '../../../../components/snackbar.dart';
import '../../../../components/text_field/form_text_field.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../utils/validator.dart';
import '../provider/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  void validateRegister() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordCtrl.text != _confirmPasswordCtrl.text) {
        showSnackbar(
          context: context,
          message: 'Password tidak sama',
          type: SnackbarType.error,
        );
        return;
      }

      final req = await context.read<AuthProvider>().registerUser(
        name: _nameCtrl.text,
        email: _emailCtrl.text,
        password: _passwordCtrl.text,
      );
      if (!mounted) return;
      if (req.success) {
        showSnackbar(
          context: context,
          message: 'Register Berhasil',
          type: SnackbarType.success,
        );
        context.pop();
      } else {
        showSnackbar(
          context: context,
          message: 'Register Gagal',
          type: SnackbarType.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Akun', style: context.titleMediumTextStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    MTextFormField(
                      controller: _nameCtrl,
                      hintText: 'Nama',
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    MTextFormField(
                      controller: _emailCtrl,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: validateEmail,
                    ),
                    MTextFormField(
                      controller: _passwordCtrl,
                      hintText: 'Kata Sandi',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      validator: validatePassword,
                    ),
                    MTextFormField(
                      controller: _confirmPasswordCtrl,
                      hintText: 'Konfirmasi Kata Sandi',
                      prefixIcon: const Icon(Icons.key),
                      validator: validatePassword,
                    ),
                  ],
                ),
              ),
              Consumer<AuthProvider>(
                builder: (context, authP, _) {
                  return SizedBox(
                    width: double.infinity,
                    child: MFilledButton(
                      onPressed: authP.isLoading
                          ? null
                          : () {
                              validateRegister();
                            },
                      borderRadius: 10,
                      icon: authP.isLoading
                          ? const CupertinoActivityIndicator()
                          : null,
                      child: const Text('Daftar'),
                    ),
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
