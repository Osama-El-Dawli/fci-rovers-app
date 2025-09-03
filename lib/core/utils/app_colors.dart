import 'package:flutter/material.dart';

abstract class AppColors {
  // =============================
  // Primary Colors
  // =============================
  static const Color primary = Color(0xFFEFC139); // الذهبي الأساسي
  static const Color primaryGlow = Color(0xFFFBD460); // الذهبي المضيء
  static const Color primaryForeground = Color(0xFF040507); // نص على الذهبي

  // =============================
  // Secondary Colors
  // =============================
  static const Color secondary = Color(0xFF5E450F); // البني الغامق
  static const Color accent = Color(0xFF86510C); // البني المتوسط
  static const Color muted = Color(0xFF1F160A); // البني الفاتح

  // =============================
  // Background & Text
  // =============================
  static const Color background = Color(0xFF040404); // الخلفية الرئيسية
  static const Color card = Color(0xFF090A0C); // خلفية الكروت
  static const Color foreground = Color(0xFFFDEFC3); // النص الذهبي الكريمي

  // =============================
  // Interactive Elements
  // =============================
  static const Color border = Color(0x33EFC139); // لون الحدود
  static const Color input = Color(0xFF3D2D12); // خلفية الإدخال
  static const Color ring = Color(0xFFE4B61E); // التركيز - نفس Primary

  // =============================
  // Utility Colors
  // =============================
  static const Color destructive = Color(0xFFEF4444); // الخطر - أحمر
  static const Color mutedForeground = Color(0xFFA08660); // نص خافت
  static const Color secondaryForeground = Color(0xFFF7F0D4); // نص على الثانوي
  static const Color accentForeground = Color(0xFFF7F0D4); // نص على Accent

  // =============================
  // Gradients - Base
  // =============================
  static const Gradient gradientHero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryGlow],
  );

  static const Gradient gradientCard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [card, muted],
  );

  static const Gradient gradientAccent = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [accent, secondary],
  );

  // =============================
  // Gradients - Components
  // =============================
  static const Gradient headerGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [primary, primaryGlow, primary],
  );

  static const Gradient quoteBoxGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [card, muted],
  );

  static const Gradient buttonHeroGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, primaryGlow],
  );

  static const Gradient buttonSecondaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [secondary, accent],
  );

  static const Gradient mediaSliderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x80090A0C), // #090a0c80 مع شفافية
      Color(0x502E1A06), // #2e1a0650 مع شفافية
    ],
  );
}
