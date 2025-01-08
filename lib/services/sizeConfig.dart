import 'package:flutter/widgets.dart';

// Global screen configuration variables
late double screenWidth;
late double screenHeight;
late double blockSizeHorizontal;
late double blockSizeVertical;
late double safeAreaHorizontal;
late double safeAreaVertical;
late double safeBlockHorizontal;
late double safeBlockVertical;

void initSizeConfig(BuildContext context) {
  screenWidth = MediaQuery.of(context).size.width;
  screenHeight = MediaQuery.of(context).size.height;
  blockSizeHorizontal = screenWidth / 100;
  blockSizeVertical = screenHeight / 100;

  var padding = MediaQuery.of(context).padding;
  safeAreaHorizontal = screenWidth - padding.left - padding.right;
  safeAreaVertical = screenHeight - padding.top - padding.bottom;
  safeBlockHorizontal = safeAreaHorizontal / 100;
  safeBlockVertical = safeAreaVertical / 100;
}

// Global functions for proportionate sizes based on 360 x 800 design
double propHeight(double inputHeight) {
  return (inputHeight / 800) *
      screenHeight; // 800 is the base height from our design
}

double propWidth(double inputWidth) {
  return (inputWidth / 360) *
      screenWidth; // 360 is the base width from our design
}

double propText(double inputTextSize) {
  return (inputTextSize / 360) *
      screenWidth; // 360 is the base width from our design
}
