import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/constant/color_constant.dart';

import '../../data/models/facility_models.dart';

class VillaCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String description;
  final List<ListFacilities> facilities;

  const VillaCard({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.description,
    required this.facilities,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadiusCard =
        BorderRadius.circular(getProportionateScreenWidth(context, 10));
    final BorderRadius borderRadiusImg = BorderRadius.only(
      topLeft: Radius.circular(getProportionateScreenWidth(context, 10)),
      topRight: Radius.circular(getProportionateScreenWidth(context, 10)),
    );
    final double thumbnailHeight = getProportionateScreenHeight(context, 70);
    final EdgeInsets paddingGridIcon = EdgeInsets.only(
        left: getProportionateScreenWidth(context, 10),
        right: getProportionateScreenWidth(context, 10),
        bottom: getProportionateScreenWidth(context, 10),
        top: getProportionateScreenWidth(context, 5));

    return Card(
      elevation: 3,
      borderOnForeground: false,
      surfaceTintColor: kWhiteColor,
      shadowColor: kBlackColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadiusCard,
      ),
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rounded Image with ClipRRect
          ClipRRect(
            borderRadius: borderRadiusImg,
            child: Image.network(
              thumbnailUrl,
              width: double.infinity,
              height: thumbnailHeight,
              fit: BoxFit.cover,
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
          // Icon Grid
          GridView.builder(
            shrinkWrap: true,
            padding: paddingGridIcon,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of icons per row
                crossAxisSpacing: 8.0, // Spacing between items horizontally
                mainAxisSpacing: 8.0, // Spacing between items vertically
                childAspectRatio: 5),
            itemCount: facilities.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(context, 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      facilities[index].icon,
                      size: 20,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      facilities[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
