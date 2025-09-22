import 'package:package_info_plus/package_info_plus.dart';

Future<String> getAppVersion() async {
  final packageInfo = await PackageInfo.fromPlatform();

  final version = packageInfo.version;
  final buildNumber = packageInfo.buildNumber;
  return '$version ($buildNumber)';
}

Future<String> getGreetingByTime() async {
  DateTime now = DateTime.now();

  if (now.hour < 10) {
    return 'Selamat Pagi';
  } else if (now.hour < 15) {
    return 'Selamat Siang';
  } else if (now.hour < 18) {
    return 'Selamat Sore';
  } else {
    return 'Selamat Malam';
  }
}
