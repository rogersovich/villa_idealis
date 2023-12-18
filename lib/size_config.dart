import 'package:flutter/material.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double defaultSize;
  late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getWidth(BuildContext context, double inputHeight) {
  SizeConfig config = SizeConfig();
  config.init(context);

  double screenWidth = config.screenWidth;
  // 375 is the layout width that designer used
  return screenWidth;
}

double getheight(BuildContext context, double inputHeight) {
  SizeConfig config = SizeConfig();
  config.init(context);

  double screenheight = config.screenHeight;
  // 375 is the layout width that designer use
  return screenheight;
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(BuildContext context, double inputHeight) {
  SizeConfig config = SizeConfig();
  config.init(context);

  double screenHeight = config.screenHeight;
  // 375 is the layout width that designer use
  return (inputHeight / 375.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(BuildContext context, double inputWidth) {
  SizeConfig config = SizeConfig();
  config.init(context);

  double screenWidth = config.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
