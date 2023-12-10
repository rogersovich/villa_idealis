//* TEXT BUTTON
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import '../constant/color_constant.dart';
import '../constant/style_constant.dart';

Icon iconButtonCustom(BuildContext context, IconData icon, Color? color,
    double fontSize, VoidCallback? onPressed) {
  return Icon(
    icon,
    color: onPressed != null ? color ?? kPrimaryColor : null,
    size: getProportionateScreenHeight(context, fontSize),
  );
}

//* ICON BUTTON
IconButton buildIconButton(BuildContext context, IconData iconURL,
    {required VoidCallback? onPressed,
    double size = 12,
    Color? color,
    String? label}) {
  return IconButton(
      onPressed: onPressed,
      icon: Icon(iconURL,
          color: color ?? kPrimaryColor,
          size: getProportionateScreenHeight(context, size),
          semanticLabel: label));
}

//* TEXT BUTTON
TextButton buildTextButton(BuildContext context, String text,
    {double rounded = 3,
    bool block = false,
    double width = 50,
    double height = 15,
    double fontSize = 6,
    FontWeight? fontWeight,
    Color? color,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    IconData? icon,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress}) {
  if (icon != null) {
    return TextButton.icon(
        onPressed: onPressed,
        onLongPress: onLongPress,
        icon:
            iconButtonCustom(context, icon, kPrimaryColor, fontSize, onPressed),
        style: textButtonStyle(
            context,
            block,
            getProportionateScreenHeight(context, width),
            getProportionateScreenHeight(context, height),
            getProportionateScreenHeight(context, fontSize),
            convertToFontWeight(weight: 500),
            color ?? kPrimaryColor,
            getProportionateScreenHeight(context, padding.horizontal),
            getProportionateScreenHeight(context, padding.vertical),
            getProportionateScreenHeight(context, rounded)),
        label: Text(text));
  } else {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: textButtonStyle(
          context,
          block,
          getProportionateScreenHeight(context, width),
          getProportionateScreenHeight(context, height),
          getProportionateScreenHeight(context, fontSize),
          convertToFontWeight(weight: 500),
          color ?? kPrimaryColor,
          getProportionateScreenHeight(context, padding.horizontal),
          getProportionateScreenHeight(context, padding.vertical),
          getProportionateScreenHeight(context, rounded)),
      child: Text(text),
    );
  }
}

//* EVELATED BUTTON
ElevatedButton buildElevatedButton(BuildContext context, String text,
    {double rounded = 3,
    bool block = false,
    double width = 50,
    double height = 15,
    double fontSize = 6,
    FontWeight? fontWeight,
    Color? color,
    Color? bgColor,
    Color? shadowColor,
    double elevation = 0,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    IconData? icon,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress}) {
  if (icon != null) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        onLongPress: onLongPress,
        icon: iconButtonCustom(context, icon, kWhiteColor, fontSize, onPressed),
        style: elevatedButtonStyle(
            context,
            block,
            getProportionateScreenHeight(context, width),
            getProportionateScreenHeight(context, height),
            getProportionateScreenHeight(context, fontSize),
            convertToFontWeight(weight: 500),
            onPressed != null ? color ?? kWhiteColor : null,
            onPressed != null ? bgColor ?? kPrimaryColor : null,
            getProportionateScreenHeight(context, padding.horizontal),
            getProportionateScreenHeight(context, padding.vertical),
            getProportionateScreenHeight(context, rounded),
            shadowColor,
            elevation),
        label: Text(text));
  } else {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: elevatedButtonStyle(
          context,
          block,
          getProportionateScreenHeight(context, width),
          getProportionateScreenHeight(context, height),
          getProportionateScreenHeight(context, fontSize),
          convertToFontWeight(weight: 500),
          onPressed != null ? color ?? kWhiteColor : null,
          onPressed != null ? bgColor ?? kPrimaryColor : null,
          getProportionateScreenHeight(context, padding.horizontal),
          getProportionateScreenHeight(context, padding.vertical),
          getProportionateScreenHeight(context, rounded),
          shadowColor,
          elevation),
      child: Text(text),
    );
  }
}

//* OUTLINED BUTTON
OutlinedButton buildOutlinedButton(BuildContext context, String text,
    {double rounded = 3,
    bool block = false,
    double width = 50,
    double height = 15,
    double fontSize = 6,
    FontWeight? fontWeight,
    Color? color,
    Color? bgColor,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    IconData? icon,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress}) {
  if (icon != null) {
    return OutlinedButton.icon(
        onPressed: onPressed,
        onLongPress: onLongPress,
        icon:
            iconButtonCustom(context, icon, kPrimaryColor, fontSize, onPressed),
        style: outlinedButtonStyle(
            context,
            block,
            getProportionateScreenHeight(context, width),
            getProportionateScreenHeight(context, height),
            getProportionateScreenHeight(context, fontSize),
            convertToFontWeight(weight: 500),
            color ?? kPrimaryColor,
            bgColor ?? Colors.transparent,
            getProportionateScreenHeight(context, padding.horizontal),
            getProportionateScreenHeight(context, padding.vertical),
            getProportionateScreenHeight(context, rounded)),
        label: Text(text));
  } else {
    return OutlinedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: outlinedButtonStyle(
          context,
          block,
          getProportionateScreenHeight(context, width),
          getProportionateScreenHeight(context, height),
          getProportionateScreenHeight(context, fontSize),
          convertToFontWeight(weight: 500),
          color ?? kPrimaryColor,
          bgColor ?? Colors.transparent,
          getProportionateScreenHeight(context, padding.horizontal),
          getProportionateScreenHeight(context, padding.vertical),
          getProportionateScreenHeight(context, rounded)),
      child: Text(text),
    );
  }
}