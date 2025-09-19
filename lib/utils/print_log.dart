import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

enum LogType { general, success, error }

void printLog(dynamic output, {LogType type = LogType.general}) {
  if (kDebugMode) {
    final generalColor = '36m'; // cyan
    final errorColor = '31m'; // red
    final successColor = '32m'; // green

    String logColor = generalColor;
    switch (type) {
      case LogType.success:
        logColor = successColor;
        break;
      case LogType.error:
        logColor = errorColor;
        break;
      default:
        break;
    }
    try {
      log('\x1B[$logColor${jsonEncode(output)}\x1B[0m');
    } catch (e) {
      final value = output.toString();
      const int maxLogSize = 1000;
      for (int i = 0; i <= value.length / maxLogSize; i++) {
        final int start = i * maxLogSize;
        int end = (i + 1) * maxLogSize;
        end = end > value.length ? value.length : end;
        print('\x1B[33m${value.substring(start, end)}\x1B[0m');
      }
    }
  }
}
