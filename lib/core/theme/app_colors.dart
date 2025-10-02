import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors (default to light theme for backward compatibility)
  static const Color primary = Color(0xFFFF6B35);
  static const Color secondary = Color(0xFFFFC857);
  static const Color accent = Color(0xFFFFE66D);
  
  // Background Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color cardBackground = Colors.white;
  static const Color inputBackground = Color(0xFFFFF8E1);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF2D2D2D);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFF9E9E9E);
  
  // Light Theme Colors
  static const Color primaryLight = Color(0xFFFF6B35);
  static const Color secondaryLight = Color(0xFFFFC857);
  static const Color accentLight = Color(0xFFFFE66D);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color cardBackgroundLight = Colors.white;
  static const Color inputBackgroundLight = Color(0xFFFFF8E1);
  static const Color textPrimaryLight = Color(0xFF2D2D2D);
  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color textLightLight = Color(0xFF9E9E9E);
  
  // Dark Theme Colors
  static const Color primaryDark = Color(0xFFFF8C42);
  static const Color secondaryDark = Color(0xFFFFD666);
  static const Color accentDark = Color(0xFFFFE97D);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color cardBackgroundDark = Color(0xFF1E1E1E);
  static const Color inputBackgroundDark = Color(0xFF2C2C2C);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textLightDark = Color(0xFF808080);
  
  // Status Colors (same for both themes)
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  
  // Rating Color
  static const Color rating = Color(0xFFFFB800);
  
  // Category Colors
  static const Color categorySnacks = Color(0xFFFFE5B4);
  static const Color categoryMeal = Color(0xFFFFD4B4);
  static const Color categoryVegan = Color(0xFFD4F1D4);
  static const Color categoryDessert = Color(0xFFFFD4E5);
  static const Color categoryDrinks = Color(0xFFD4E5FF);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient headerGradient = LinearGradient(
    colors: [Color(0xFFFFC857), Color(0xFFFFE66D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient primaryGradientLight = LinearGradient(
    colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient primaryGradientDark = LinearGradient(
    colors: [Color(0xFFFF8C42), Color(0xFFFFAA66)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient headerGradientLight = LinearGradient(
    colors: [Color(0xFFFFC857), Color(0xFFFFE66D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient headerGradientDark = LinearGradient(
    colors: [Color(0xFFFFD666), Color(0xFFFFE97D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}