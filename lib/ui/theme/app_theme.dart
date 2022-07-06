import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_theme.dart';

mixin AppTheme {
  static const Color _defaultFillColor = AppColors.neutral0;
  static final Color _defaultDocusColor = _defaultFillColor.withOpacity(0.12);

  static ThemeData defaultThemeData =
      themeData(defaultColorScheme, _defaultDocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) =>
      ThemeData(
        canvasColor: colorScheme.background,
        colorScheme: colorScheme,
        disabledColor: colorScheme.onBackground.withAlpha(40),
        dividerColor: colorScheme.onBackground.withAlpha(40),
        elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
        errorColor: colorScheme.error,
        focusColor: focusColor,
        fontFamily: 'Inter',
        highlightColor: Colors.transparent,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        inputDecorationTheme: inputDecorationTheme(colorScheme),
        primaryColor: colorScheme.primary,
        primaryColorLight: colorScheme.primaryContainer,
        scaffoldBackgroundColor: colorScheme.background,
        splashColor: AppColors.neutral7.withOpacity(0.2),
      );

  static const ColorScheme defaultColorScheme = ColorScheme(
    background: AppColors.neutral7,
    brightness: Brightness.light,
    error: AppColors.danger,
    onBackground: AppColors.neutral0,
    onError: AppColors.neutral7,
    onPrimary: AppColors.neutral7,
    onSecondary: AppColors.neutral7,
    onSurface: AppColors.neutral0,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.neutral7,
  );

  static ElevatedButtonThemeData elevatedButtonThemeData(
    ColorScheme colorScheme,
  ) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          onPrimary: colorScheme.onPrimary,
          onSurface: colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          primary: colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle:
              AppTextTheme.subtitle1.copyWith(color: colorScheme.onPrimary),
        ),
      );

  static InputDecorationTheme inputDecorationTheme(
    ColorScheme colorScheme,
  ) =>
      InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.onBackground.withAlpha(80),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.onBackground.withAlpha(200),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.onBackground.withAlpha(40),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        labelStyle: AppTextTheme.paragraph1,
        hintStyle: AppTextTheme.subtitle1.copyWith(
          color: colorScheme.onBackground.withAlpha(40),
        ),
      );
}
