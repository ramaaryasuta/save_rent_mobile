import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../components/base_dialog.dart';
import '../../../../../components/button/filled_button.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../auth/ui/provider/auth_provider.dart';

void logoutDialog(BuildContext context) {
  baseDialog(
    context,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apakah anda yakin ingin keluar dari akun saverent ini?',
            style: context.bodyMediumTextStyle!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 10,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Batal',
                  style: context.bodySmallTextStyle!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MFilledButton(
                onPressed: () {
                  final authP = context.read<AuthProvider>();
                  Navigator.pop(context);
                  authP.logoutUser(context);
                },
                borderRadius: 10,
                child: Text(
                  'Keluar',
                  style: context.bodySmallTextStyle!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.onPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
