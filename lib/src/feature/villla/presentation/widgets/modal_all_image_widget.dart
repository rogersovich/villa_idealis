// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/constant/color_constant.dart';
import 'package:villa_idealis/src/core/utils/text_util.dart';

import '../../data/datasources/villa_images_data.dart';

class ModalAllImageWidget extends StatefulWidget {
  const ModalAllImageWidget({Key? key}) : super(key: key);

  @override
  _ModalAllImageWidgetState createState() => _ModalAllImageWidgetState();
}

class _ModalAllImageWidgetState extends State<ModalAllImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQueryData.fromView(View.of(context)).padding.top,
        left: getProportionateScreenWidth(context, 16),
        right: getProportionateScreenWidth(context, 16),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: getProportionateScreenWidth(context, 10),
                  top: getProportionateScreenWidth(context, 4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTextCustom(context, "Semua gambar",
                      weight: 'w600', fontSize: 17),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: kErrorColor,
                      size: getProportionateScreenWidth(context, 20),
                    ),
                  )
                ],
              ),
            ),
            const ImageColumnWidget(),
          ],
        ),
      ),
    );
  }
}

class ImageColumnWidget extends StatelessWidget {
  const ImageColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: VillaImageData.imgList.map((imageUrl) {
        return Column(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              width: double.infinity,
              semanticLabel: "Villa 1",
            ),
            // Add additional widgets or spacing between images if needed
            const SizedBox(height: 16.0),
          ],
        );
      }).toList(),
    );
  }
}
