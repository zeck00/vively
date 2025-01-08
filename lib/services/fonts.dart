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

  static TextStyle headline2(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(24),
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  static TextStyle subtitle1(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(18),
      fontWeight: FontWeight.w600,
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

  static TextStyle bodyText2(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(14),
      fontWeight: FontWeight.normal,
      color: AppColors.black.withOpacity(0.8),
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

  static TextStyle smallText(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(12),
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    );
  }

  static TextStyle chipText(BuildContext context, bool isSelected) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(14),
      fontWeight: FontWeight.w500,
      color: isSelected ? AppColors.white : AppColors.black,
    );
  }

  static TextStyle linkText(BuildContext context, bool isUnderlined) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(14),
      fontWeight: FontWeight.w500,
      color: AppColors.teal,
      decoration: isUnderlined ? TextDecoration.underline : TextDecoration.none,
      decorationColor: AppColors.teal,
    );
  }

  static TextStyle inputHintGrey(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(14),
      fontWeight: FontWeight.normal,
      color: AppColors.black.withOpacity(0.5),
    );
  }

  static TextStyle errorText(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(12),
      fontWeight: FontWeight.normal,
      color: AppColors.purple,
    );
  }

  static TextStyle highlightedText(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(16),
      fontWeight: FontWeight.w600,
      color: AppColors.blue,
    );
  }

  static TextStyle cardTitle(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(20),
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  static TextStyle cardSubtitle(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(14),
      fontWeight: FontWeight.normal,
      color: AppColors.black.withOpacity(0.7),
    );
  }

  static TextStyle actionLabel(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(12),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  static TextStyle sectionHeader(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(22),
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  static TextStyle searchText(BuildContext context) {
    return TextStyle(
      fontFamily: getFont(context),
      fontSize: propText(16),
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    );
  }
}
