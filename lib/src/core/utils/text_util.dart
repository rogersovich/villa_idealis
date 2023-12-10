import 'package:flutter/material.dart';

import '../../../size_config.dart';

TextAlign getTextAlignFromString(String alignment) {
  switch (alignment) {
    case 'left':
      return TextAlign.left;
    case 'center':
      return TextAlign.center;
    case 'right':
      return TextAlign.right;
    case 'justify':
      return TextAlign.justify;
    case 'start':
      return TextAlign.start;
    case 'end':
      return TextAlign.end;
    default:
      return TextAlign
          .left; // Default value if the string doesn't match any alignment
  }
}

FontWeight getFontWeightFromString(String weight) {
  switch (weight) {
    case 'w100':
      return FontWeight.w100;
    case 'w200':
      return FontWeight.w200;
    case 'w300':
      return FontWeight.w300;
    case 'w400':
      return FontWeight.w400;
    case 'w500':
      return FontWeight.w500;
    case 'w600':
      return FontWeight.w600;
    case 'w700':
      return FontWeight.w700;
    case 'w800':
      return FontWeight.w800;
    case 'w900':
      return FontWeight.w900;
    default:
      return FontWeight
          .normal; // Default value if the string doesn't match any font weight
  }
}

TextDecoration getTextDecorationFromString(String decoration) {
  switch (decoration) {
    case 'none':
      return TextDecoration.none;
    case 'underline':
      return TextDecoration.underline;
    case 'lineThrough':
      return TextDecoration.lineThrough;
    case 'overline':
      return TextDecoration.overline;
    default:
      return TextDecoration
          .none; // Default value if the string doesn't match any text decoration
  }
}

FontStyle getFontStyleFromString(String style) {
  switch (style) {
    case 'normal':
      return FontStyle.normal;
    case 'italic':
      return FontStyle.italic;
    default:
      return FontStyle
          .normal; // Default value if the string doesn't match any font style
  }
}

TextOverflow getTextOverflowFromString(String overflow) {
  switch (overflow) {
    case 'clip':
      return TextOverflow.clip;
    case 'ellipsis':
      return TextOverflow.ellipsis;
    case 'fade':
      return TextOverflow.fade;
    default:
      return TextOverflow
          .clip; // Default value if the string doesn't match any text overflow
  }
}

Text buildTextCustom(BuildContext context, String text,
    {Color color = Colors.black,
    double fontSize = 8,
    String weight = 'normal',
    String align = 'left',
    String? fontFamily,
    double letterSpacing = 0,
    double lineHeight = 1.1,
    String decoration = 'none',
    String fontStyle = 'normal',
    String overflow = 'clip',
    int? maxLines}) {
  return Text(text,
      textAlign: getTextAlignFromString(align),
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontWeight: getFontWeightFromString(weight),
        fontSize: getProportionateScreenHeight(context, fontSize),
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        height: lineHeight,
        decoration: getTextDecorationFromString(decoration),
        fontStyle: getFontStyleFromString(fontStyle),
        overflow: getTextOverflowFromString(overflow),
      ));
}