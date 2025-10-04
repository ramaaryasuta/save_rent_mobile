import 'package:flutter/material.dart';

import '../core/extensions/context_extension.dart';

void baseDialog(BuildContext context, {required Widget child}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: context.onPrimaryColor,
      surfaceTintColor: context.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: child,
    ),
  );
}
