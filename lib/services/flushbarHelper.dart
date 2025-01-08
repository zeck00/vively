import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:vively/services/sizeConfig.dart';

class FlushbarHelper {
  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration? duration,
  }) {
    Flushbar(
      message: message,
      duration: duration ?? const Duration(seconds: 3),
      margin: EdgeInsets.all(propWidth(8)),
      borderRadius: BorderRadius.circular(propWidth(10)),
      backgroundColor: AppColors.mint.withOpacity(0.95),
      messageText: Text(
        message,
        style: Fonts.bodyText1(context),
      ),
      icon: Icon(
        Icons.check_circle_outline_rounded,
        size: propWidth(28),
        color: AppColors.black,
      ),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static void showError({
    required BuildContext context,
    required String message,
    Duration? duration,
  }) {
    Flushbar(
      message: message,
      duration: duration ?? const Duration(seconds: 3),
      margin: EdgeInsets.all(propWidth(8)),
      borderRadius: BorderRadius.circular(propWidth(10)),
      backgroundColor: AppColors.red.withOpacity(0.95),
      messageText: Text(
        message,
        style: Fonts.bodyText1(context).copyWith(color: AppColors.white),
      ),
      icon: Icon(
        Icons.error_outline_rounded,
        size: propWidth(28),
        color: AppColors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
