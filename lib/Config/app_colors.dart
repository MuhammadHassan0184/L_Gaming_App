import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ============================================================
  // Ludo Specific Colors
  // ============================================================

  static const Color ludoBackground = Color(0xFFF3F1FC);

  static const Color yellowStart = Color(0xFFFFE86A);
  static const Color yellowEnd = Color(0xFFFFA800);

  static const Color yellowButtonStart = Color(0xFFFFE15A);
  static const Color yellowButtonEnd = Color(0xFFFFB000);

  static const Color yellowShadow = Color(0xFFD98A00);

  static const Color greenCardStart = Color(0xFF16C98A);
  static const Color greenCardEnd = Color(0xFF079F68);

  static const Color greenDark = Color(0xFF087C55);

  static const Color purpleLight = Color(0xFFEAD7F7);
  static const Color purpleCard = Color(0xFFE6D2F2);

  static const Color progressGreen = Color(0xFF158A61);

  static const Color gold = Color(0xFFFFC928);

  static const Color coinYellow = Color(0xFFFFC72C);

  static const Color white = Color(0xFFFFFFFF);

  static const Color darkText = Color(0xFF17151D);

  static const Color secondaryText = Color(0xFF62606A);

  static const Color borderLight = Color(0xFFE2DFF0);

  // ============================================================
  // Country Screen Colors
  // ============================================================

  static const Color countryBackground = Color(0xFFF4F2FA);

  static const Color countryHeaderStart = Color(0xFFFFE9E5);
  static const Color countryHeaderMiddle = Color(0xFFF4E5F7);
  static const Color countryHeaderEnd = Color(0xFFE5E2FC);

  static const Color countryCard = Color(0xFFF0F1F3);

  static const Color countrySelected = Color(0xFFE7D5F5);

  static const Color countrySelectedBorder = Color(0xFF8A4BB8);

  static const Color countryText = Color(0xFF27242C);

  static const Color countryMutedText = Color(0xFF8B8791);

  static const Color countryActive = Color(0xFF1F1C24);

  static const Color countryCheck = Color(0xFF111015);

  static const LinearGradient countryHeaderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [countryHeaderStart, countryHeaderMiddle, countryHeaderEnd],
  );

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFE7EF), Color(0xFFEBDCF8), Color(0xFFE3E5FF)],
  );

  static const LinearGradient yellowGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [yellowStart, yellowEnd],
  );

  static const LinearGradient startGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [yellowButtonStart, yellowButtonEnd],
  );

  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [greenCardStart, greenCardEnd],
  );
}
