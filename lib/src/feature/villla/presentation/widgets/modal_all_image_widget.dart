// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/constant/color_constant.dart';
import 'package:villa_idealis/src/core/utils/button_util.dart';
import 'package:villa_idealis/src/core/utils/text_util.dart';
import 'package:villa_idealis/src/core/utils/widget_util.dart';

import '../../data/datasources/villa_images_data.dart';

class ModalAllImageWidget extends StatefulWidget {
  const ModalAllImageWidget({Key? key}) : super(key: key);

  @override
  _ModalAllImageWidgetState createState() => _ModalAllImageWidgetState();
}

class _ModalAllImageWidgetState extends State<ModalAllImageWidget> {
  final ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      _isAtTop = _scrollController.offset <= 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isAtTop
          ? null
          : FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              backgroundColor: kWhiteColor,
              shape: const CircleBorder(),
              mini: true,
              child: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: kBlackColor,
              ),
            ),
      body: Container(
        color: kWhiteColor,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: MediaQueryData.fromView(View.of(context)).padding.top,
          left: getProportionateScreenWidth(context, 16),
          right: getProportionateScreenWidth(context, 16),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: getProportionateScreenWidth(context, 4),
                    top: getProportionateScreenWidth(context, 4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTextCustom(context, "Semua gambar",
                        weight: 'w700', fontSize: 18),
                    SizedBox(
                      width: getProportionateScreenWidth(context, 30),
                      child: buildIconButton(context, Icons.close_rounded,
                          color: kErrorColor,
                          size: getProportionateScreenWidth(context, 10),
                          onPressed: () {
                        Navigator.pop(context);
                      }),
                    )
                  ],
                ),
              ),
              const ImageColumnWidget(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}

class ImageColumnWidget extends StatelessWidget {
  const ImageColumnWidget({super.key, Key? imagekey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(VillaImageData.imgList.length, (index) {
        final imageUrl = VillaImageData.imgList[index];
        return Column(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              width: double.infinity,
              semanticLabel:
                  "Villa ${index + 1}", // Use index to create a unique semantic label
            ),
            // Add additional widgets or spacing between images if needed
            buildSpacing(context, size: 6)
          ],
        );
      }),
    );
  }
}
