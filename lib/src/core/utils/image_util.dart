import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../constant/color_constant.dart';

//* IMAGE
Widget buildImage(BuildContext context, String url,
    {double width = 50,
    double height = 50,
    BoxFit fit = BoxFit.cover,
    bool shadow = false,
    Color? shadowColor,
    double rounded = 0}) {
  double widthImg = getProportionateScreenHeight(context, width);
  double heightImg = getProportionateScreenHeight(context, height);
  final isImageOnline = Uri.tryParse(url)?.hasScheme == true;

  return Container(
    width: widthImg,
    height: heightImg,
    decoration: BoxDecoration(
      boxShadow: shadow
          ? [
              BoxShadow(
                color: shadowColor ?? Colors.red.withOpacity(0.7),
                blurRadius: 4,
                offset: const Offset(2, 3), // Shadow position
              ),
            ]
          : null,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(rounded),
      child: isImageOnline
          ? Image.network(
              url,
              width: widthImg,
              height: heightImg,
              fit: fit,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset(
                  'assets/images/default.png',
                  width: widthImg,
                  height: heightImg,
                  fit: fit,
                );
              },
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
            )
          : Image.asset(
              "assets/images/$url",
              width: widthImg,
              height: heightImg,
              fit: fit,
              semanticLabel: "Semantic Label",
            ),
    ),
  );
}

//* AVATAR
Widget buildAvatar(BuildContext context, String url,
    {double size = 50,
    BoxFit fit = BoxFit.cover,
    dynamic rounded = 'full',
    bool shadow = false,
    Color? shadowColor,
    String? title}) {
  double sizeAvatar = getProportionateScreenHeight(context, size);
  final isImageOnline = Uri.tryParse(url)?.hasScheme == true;
  return Container(
    width: sizeAvatar,
    height: sizeAvatar,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
          rounded == 'full' ? sizeAvatar / 2 : rounded.toDouble()),
      boxShadow: shadow
          ? [
              BoxShadow(
                color: shadowColor ?? Colors.red.withOpacity(0.7),
                blurRadius: 4,
                offset: const Offset(2, 3), // Shadow position
              ),
            ]
          : null,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(
          rounded == 'full' ? sizeAvatar / 2 : rounded.toDouble()),
      child: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(title != null ? 0.5 : 0.0),
              BlendMode.colorBurn,
            ),
            child: isImageOnline
                ? Image.network(
                    url,
                    width: sizeAvatar,
                    height: sizeAvatar,
                    fit: fit,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        'assets/images/skizofrenia.jpg',
                        width: sizeAvatar,
                        height: sizeAvatar,
                        fit: fit,
                      );
                    },
                  )
                : Image.asset(
                    "assets/images/$url",
                    width: sizeAvatar,
                    height: sizeAvatar,
                    fit: fit,
                  ),
          ),
          if (title != null)
            Container(
              width: sizeAvatar,
              height: sizeAvatar,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: getProportionateScreenHeight(context, 12),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
