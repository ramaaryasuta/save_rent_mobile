import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFC72020), // warna utama baru
  onPrimary: Color(0xFFFFFFFF), // putih supaya kontras
  primaryContainer: Color(0xFFFFDAD6), // merah muda pucat
  onPrimaryContainer: Color(0xFF410002), // gelap untuk kontras di container
  secondary: Color(0xFF6E5E72),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFEADFEA),
  onSecondaryContainer: Color(0xFF241628),
  tertiary: Color(0xFF8B0000), // merah tua untuk aksen
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDAD6),
  onTertiaryContainer: Color(0xFF410002),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1D1B1F),
  surfaceContainerHighest: Color(0xFFEADFEA),
  onSurfaceVariant: Color(0xFF6E5E72),
  inverseSurface: Color(0xFFD2CAD5),
  onInverseSurface: Color(0xFFF6EFF3),
  inversePrimary: Color(0xFFFA8072), // inverse dari merah
  surfaceTint: Color(0xFFC72020),
  outline: Color(0xFF9892A0),
  outlineVariant: Color(0xFFA584D0),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFC72020), // warna utama baru
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF410002),
  onPrimaryContainer: Color(0xFFFFDAD6),
  secondary: Color(0xFF9EB0FF),
  onSecondary: Color(0xFF455763),
  secondaryContainer: Color(0xFF71A4B1),
  onSecondaryContainer: Color(0xFFBDC5FF),
  tertiary: Color(0xFFFA8072),
  onTertiary: Color(0xFF6B5E65),
  tertiaryContainer: Color(0xFF9B787D),
  onTertiaryContainer: Color(0xFFFFDAD6),
  error: Color(0xFFFF6E6E),
  onError: Color(0xFF82111D),
  errorContainer: Color(0xFFD12C46),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF333232),
  onSurface: Color(0xFFC5B3F9),
  onSurfaceVariant: Color(0xFFA584D0),
  surfaceContainerHighest: Color(0xFF4B444D),
  outline: Color(0xFFD2C8D6),
  outlineVariant: Color(0xFF6E5E72),
  onInverseSurface: Color(0xFF1D1B1E),
  inverseSurface: Color(0xFFC5B3F9),
  inversePrimary: Color(0xFFFF8A80),
  surfaceTint: Color(0xFFC72020),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
);
