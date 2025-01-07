import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'size_config.dart';
import 'colors.dart';

class Fonts {
  static bool isArabic(BuildContext context) {
    return context.locale.languageCode == 'ar';
  }

  static String getFont(BuildContext context) {
    return isArabic(context) ? 'Almarai' : 'Kanit';
  }

  // Example font styles:
  static TextStyle headline1(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(40),
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  static TextStyle bodyText1(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(16),
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(14),
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    );
  }

  static TextStyle caption(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(12),
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    );
  }

  static TextStyle inputHint(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(12),
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    );
  }

  static TextStyle inputHintGrey(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(12),
      fontWeight: FontWeight.normal,
      color: AppColors.black.withOpacity(0.5),
    );
  }

  static TextStyle cardTitle(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(18),
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  static TextStyle miniText(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(10),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  static TextStyle sectionTitle(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(20),
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    );
  }

  static TextStyle linkText(BuildContext context, bool isUnderlined) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(12),
      fontWeight: FontWeight.normal,
      color: AppColors.teal,
      decoration: isUnderlined ? TextDecoration.underline : TextDecoration.none,
      decorationColor: AppColors.teal,
    );
  }

  static TextStyle highlightedText(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(16),
      fontWeight: FontWeight.bold,
      color: AppColors.mint,
    );
  }

  static TextStyle errorText(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(14),
      fontWeight: FontWeight.normal,
      color: AppColors.purple,
    );
  }
}
