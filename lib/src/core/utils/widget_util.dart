import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../constant/color_constant.dart';

//* DIVIDER
Divider buildDivider(
  BuildContext context, {
  Color? color,
  double height = 20,
  double thickness = 0.1,
  double indent = 15,
  double endIndent = 15,
}) {
  return Divider(
    color: color ?? kBlackColor,
    thickness: thickness,
    height: height,
    indent: indent,
    endIndent: endIndent,
  );
}

//* VERTICAL & HORIZONTAL SPACING
SizedBox buildSpacing(BuildContext context,
    {double size = 2, String type = 'vertical'}) {
  return type == 'vertical'
      ? SizedBox(
          height: getProportionateScreenHeight(context, size),
        )
      : SizedBox(
          width: getProportionateScreenWidth(context, size),
        );
}
