import 'package:flutter/material.dart';

import '../core/extensions/context_extension.dart';

enum SnackbarType { success, error, general }

void showSnackbar({
  required BuildContext context,
  required String message,
  SnackbarType type = SnackbarType.general,
}) {
  Color color = Colors.green;
  IconData icon = Icons.check;

  switch (type) {
    case SnackbarType.success:
      color = Colors.green;
      icon = Icons.check_circle_outline_rounded;
      break;
    case SnackbarType.error:
      color = Colors.red;
      icon = Icons.error;
      break;
    case SnackbarType.general:
      color = context.primaryColor;
      icon = Icons.info;
      break;
  }

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Row(
        spacing: 10,
        children: [
          Icon(icon, color: color),
          Expanded(
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              style: context.bodyMediumTextStyle!.copyWith(color: color),
            ),
          ),
        ],
      ),

      backgroundColor: Colors.white,
    ),
  );
}
