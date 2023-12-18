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
    size: getProportionateScreenWidth(context, fontSize),
  );
}

//* ICON BUTTON
IconButton buildIconButton(BuildContext context, IconData iconURL,
    {required VoidCallback? onPressed,
    double size = 12,
    double padding = 2,
    Color? color,
    String? label}) {
  final iconSize = getProportionateScreenHeight(context, size);
  final iconPadding = getProportionateScreenHeight(context, padding);
  return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            Size(iconSize, iconSize),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.all(iconPadding))),
      icon: Icon(iconURL,
          color: color ?? kPrimaryColor, size: iconSize, semanticLabel: label));
}

//* TEXT BUTTON
TextButton buildTextButton(BuildContext context, String text,
    {double rounded = 4,
    bool block = false,
    double width = 100,
    double height = 30,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    IconData? icon,
    String? iconPosition = 'left',
    required VoidCallback? onPressed,
    VoidCallback? onLongPress}) {
  if (icon != null) {
    final Icon iconCustom =
        iconButtonCustom(context, icon, kPrimaryColor, fontSize, onPressed);
    final SizedBox spaceIconAndText = SizedBox(
      width: getProportionateScreenWidth(context, 6),
    );
    final List<Widget> childrenTextIcon = iconPosition == "left"
        ? [
            iconCustom,
            spaceIconAndText,
            Text(text),
          ]
        : [
            Text(text),
            spaceIconAndText,
            iconCustom,
          ];

    return TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: textButtonStyle(
            context,
            block,
            getProportionateScreenWidth(context, width),
            getProportionateScreenWidth(context, height),
            getProportionateScreenWidth(context, fontSize),
            fontWeight,
            color ?? kPrimaryColor,
            getProportionateScreenWidth(context, padding.horizontal),
            getProportionateScreenWidth(context, padding.vertical),
            getProportionateScreenWidth(context, rounded)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: childrenTextIcon,
        ));
  } else {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: textButtonStyle(
          context,
          block,
          getProportionateScreenWidth(context, width),
          getProportionateScreenWidth(context, height),
          getProportionateScreenWidth(context, fontSize),
          fontWeight,
          color ?? kPrimaryColor,
          getProportionateScreenWidth(context, padding.horizontal),
          getProportionateScreenWidth(context, padding.vertical),
          getProportionateScreenWidth(context, rounded)),
      child: Text(text),
    );
  }
}

//* EVELATED BUTTON
ElevatedButton buildElevatedButton(BuildContext context, String text,
    {double rounded = 4,
    bool block = false,
    double width = 130,
    double height = 30,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    Color? bgColor,
    Color? shadowColor,
    double elevation = 0,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    IconData? icon,
    String? iconPosition = 'left',
    required VoidCallback? onPressed,
    VoidCallback? onLongPress}) {
  if (icon != null) {
    final Icon iconCustom =
        iconButtonCustom(context, icon, kWhiteColor, fontSize, onPressed);
    final SizedBox spaceIconAndText = SizedBox(
      width: getProportionateScreenWidth(context, 6),
    );
    final List<Widget> childrenTextIcon = iconPosition == "left"
        ? [
            iconCustom,
            spaceIconAndText,
            Text(text),
          ]
        : [
            Text(text),
            spaceIconAndText,
            iconCustom,
          ];
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: elevatedButtonStyle(
          context,
          block,
          getProportionateScreenWidth(context, width),
          getProportionateScreenWidth(context, height),
          getProportionateScreenWidth(context, fontSize),
          fontWeight,
          onPressed != null ? color ?? kWhiteColor : null,
          onPressed != null ? bgColor ?? kPrimaryColor : null,
          getProportionateScreenWidth(context, padding.horizontal),
          getProportionateScreenWidth(context, padding.vertical),
          getProportionateScreenWidth(context, rounded),
          shadowColor,
          elevation),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: childrenTextIcon,
      ),
    );
  } else {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: elevatedButtonStyle(
          context,
          block,
          getProportionateScreenWidth(context, width),
          getProportionateScreenWidth(context, height),
          getProportionateScreenWidth(context, fontSize),
          fontWeight,
          onPressed != null ? color ?? kWhiteColor : null,
          onPressed != null ? bgColor ?? kPrimaryColor : null,
          getProportionateScreenWidth(context, padding.horizontal),
          getProportionateScreenWidth(context, padding.vertical),
          getProportionateScreenWidth(context, rounded),
          shadowColor,
          elevation),
      child: Text(text),
    );
  }
}

//* OUTLINED BUTTON
OutlinedButton buildOutlinedButton(BuildContext context, String text,
    {double rounded = 4,
    bool block = false,
    double width = 130,
    double height = 30,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    Color? borderColor,
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
            getProportionateScreenWidth(context, width),
            getProportionateScreenWidth(context, height),
            getProportionateScreenWidth(context, fontSize),
            fontWeight,
            color ?? kPrimaryColor,
            bgColor ?? Colors.transparent,
            borderColor ?? kPrimaryColor,
            getProportionateScreenWidth(context, padding.horizontal),
            getProportionateScreenWidth(context, padding.vertical),
            getProportionateScreenWidth(context, rounded)),
        label: Text(text));
  } else {
    return OutlinedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: outlinedButtonStyle(
          context,
          block,
          getProportionateScreenWidth(context, width),
          getProportionateScreenWidth(context, height),
          getProportionateScreenWidth(context, fontSize),
          fontWeight,
          color ?? kPrimaryColor,
          bgColor ?? Colors.transparent,
          borderColor ?? kPrimaryColor,
          getProportionateScreenWidth(context, padding.horizontal),
          getProportionateScreenWidth(context, padding.vertical),
          getProportionateScreenWidth(context, rounded)),
      child: Text(text),
    );
  }
}
