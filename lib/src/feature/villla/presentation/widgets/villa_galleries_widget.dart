import 'package:flutter/material.dart';
import 'package:villa_idealis/src/core/models/villa_models.dart';
import 'package:villa_idealis/src/feature/villla/presentation/widgets/villa_image_carousel_widget.dart';

import '../../../../../size_config.dart';
import '../../../../core/constant/color_constant.dart';

class VillaGalleriesWidget extends StatefulWidget {
  final List<Gallery> galleries; // Adjust the type according to your data model

  const VillaGalleriesWidget({Key? key, required this.galleries})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VillaGalleriesWidgetState createState() => _VillaGalleriesWidgetState();
}

class _VillaGalleriesWidgetState extends State<VillaGalleriesWidget> {
  // Add any state or logic here if necessary

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VillaImageCarouselWidget(
          galleries: widget.galleries,
        ),
        Positioned(
          top: getProportionateScreenWidth(context, 10),
          left: getProportionateScreenWidth(context, 18),
          child: Container(
            width: 40,
            height: 34.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.5),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: kWhiteColor,
                size: 16,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
          top: getProportionateScreenWidth(context, 10),
          right: getProportionateScreenWidth(context, 10),
          child: Row(
            children: [
              Container(
                width: 34.0,
                height: 34.0,
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.6),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.share_rounded,
                    color:
                        kWhiteColor,
                    size: 16,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
