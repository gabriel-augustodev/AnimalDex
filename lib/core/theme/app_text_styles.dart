import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const subtitle = TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  static const body = TextStyle(
    fontSize: 14,
    color: AppColors.textDark,
  );

  /// 🔥 ESTE é o textTheme que o ThemeData espera
  static TextTheme get textTheme => const TextTheme(
        titleLarge: title,
        titleMedium: subtitle,
        bodyMedium: body,
      );
}
