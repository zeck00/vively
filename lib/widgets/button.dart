import 'package:flutter/material.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:vively/services/size_config.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double w;
  final double h;
  final LinearGradient gradient;
  const CustomButton({
    super.key,
    required this.w,
    required this.text,
    required this.onPressed,
    this.gradient = const LinearGradient(
      colors: [
        AppColors.mint,
        AppColors.blue,
      ],
    ),
    this.backgroundColor = AppColors.black,
    this.h = 35,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: propWidth(w),
        height: propHeight(h), // Use h here
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(propWidth(50)),
        ),
        alignment: Alignment
            .center, // Ensures the text is centered vertically and horizontally
        child: Text(
          text,
          style: Fonts.buttonText(context),
          textAlign:
              TextAlign.center, // Ensures text is centered inside the button
        ),
      ),
    );
  }
}
