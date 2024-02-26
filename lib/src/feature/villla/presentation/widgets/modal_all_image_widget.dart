// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/constant/color_constant.dart';
import 'package:villa_idealis/src/core/utils/button_util.dart';
import 'package:villa_idealis/src/core/utils/text_util.dart';
import 'package:villa_idealis/src/core/utils/widget_util.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/models/villa_models.dart';

class ModalAllImageWidget extends StatefulWidget {
  final List<Gallery> galleries;

  const ModalAllImageWidget({Key? key, required this.galleries})
      : super(key: key);

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
              ImageColumnWidget(
                galleries: widget.galleries,
              ),
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
  final List<Gallery> galleries;
  const ImageColumnWidget({super.key, Key? imagekey, required this.galleries});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(galleries.length, (index) {
        final imageUrl = '${AppConstants.apiUrl}/${galleries[index].image}';
        return Column(
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset(
                  'assets/images/default.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              },
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  height: 200,
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
            ),
            buildSpacing(context, size: 6)
          ],
        );
      }),
    );
  }
}
