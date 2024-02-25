// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:villa_idealis/src/core/models/villa_models.dart';

import '../../../../../size_config.dart';
import '../../../../core/constant/color_constant.dart';
import '../../../../core/constant/style_constant.dart';
import '../../../../core/utils/text_util.dart';
import '../../../../core/utils/widget_util.dart';

class DraggableBottomSheet extends StatefulWidget {
  final List<Facility> facilities;

  const DraggableBottomSheet({super.key, required this.facilities});

  @override
  _DraggableBottomSheetState createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  double stripHeight = 3.0;
  double maxChildSize = 0.7;
  double initChildSize = 0.4;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double fontSizeTextIcon = getProportionateScreenWidth(context, 12);
    final double fontSizeIcon = getProportionateScreenWidth(context, 22);

    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: maxChildSize,
      initialChildSize: initChildSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.only(
            top: getProportionateScreenWidth(context, 12),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kGrayColor,
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(context, 4),
                      ),
                    ),
                    height: getProportionateScreenHeight(context, stripHeight),
                    width: getProportionateScreenWidth(context, 50),
                  ),
                ),
                buildSpacing(context, size: 8),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(context, 14),
                  ),
                  child: buildTextCustom(context, "Semua fasilitas",
                      weight: 'w600', fontSize: 17),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(context, 14),
                        vertical: getProportionateScreenWidth(context, 12)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of icons per row
                              crossAxisSpacing: 8.0, // Spacing horizontally
                              mainAxisSpacing: 8.0, // Spacing vertically
                              childAspectRatio: 5),
                      itemCount: widget.facilities.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  getProportionateScreenWidth(context, 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(getIconData(widget.facilities[index].icon!),
                                  size: fontSizeIcon, color: kPrimaryColor),
                              SizedBox(
                                  width:
                                      getProportionateScreenWidth(context, 18)),
                              Text(
                                "${widget.facilities[index].value != null && widget.facilities[index].value != '0' ? '${widget.facilities[index].value} ' : ''}${widget.facilities[index].title}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: fontSizeTextIcon,
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
