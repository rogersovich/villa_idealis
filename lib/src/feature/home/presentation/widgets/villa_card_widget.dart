// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/constant/color_constant.dart';
import 'package:villa_idealis/src/core/utils/button_util.dart';

import '../../../../../routes.dart';
import '../../data/models/facility_models.dart';

class VillaCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String description;
  final List<ListFacilities> facilities;
  final bool isImageOnline;

  const VillaCard(
      {Key? key,
      required this.thumbnailUrl,
      required this.title,
      required this.description,
      required this.facilities,
      this.isImageOnline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadiusCard =
        BorderRadius.circular(getProportionateScreenWidth(context, 10));
    final BorderRadius borderRadiusImg = BorderRadius.only(
      topLeft: Radius.circular(getProportionateScreenWidth(context, 10)),
      topRight: Radius.circular(getProportionateScreenWidth(context, 10)),
    );
    final double thumbnailHeight = getProportionateScreenWidth(context, 160);
    final EdgeInsets paddingCard = EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(context, 8),
        horizontal: getProportionateScreenWidth(context, 12));
    final double fontSizeTitle = getProportionateScreenWidth(context, 16);
    final double fontSizeDesc = getProportionateScreenWidth(context, 12);
    final double fontSizeTextIcon = getProportionateScreenWidth(context, 11);
    final double fontSizeIcon = getProportionateScreenWidth(context, 16);
    final double fontSizeCode = getProportionateScreenWidth(context, 14);

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
          //* Rounded Image with ClipRRect
          ClipRRect(
            borderRadius: borderRadiusImg,
            child: isImageOnline
                ? Image.network(
                    thumbnailUrl,
                    width: double.infinity,
                    height: thumbnailHeight,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    thumbnailUrl,
                    width: double.infinity,
                    height: thumbnailHeight,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: paddingCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //* Description
                Text(
                  description,
                  style:
                      TextStyle(fontSize: fontSizeDesc, color: Colors.black54),
                ),
                //* Icon Grid
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of icons per row
                      crossAxisSpacing:
                          8.0, // Spacing between items horizontally
                      mainAxisSpacing: 0.0, // Spacing between items vertically
                      childAspectRatio: 5),
                  itemCount: facilities.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // decoration: BoxDecoration(color: kPrimaryColor),
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(context, 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(facilities[index].icon,
                              size: fontSizeIcon, color: Colors.black54),
                          const SizedBox(width: 10.0),
                          Text(
                            facilities[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: fontSizeTextIcon,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                //* Code and Button Detail
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Kode\n',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: fontSizeDesc,
                        ),
                      ),
                      TextSpan(
                        text: 'CBM-DA001',
                        style: TextStyle(
                            color: kBlackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSizeCode,
                            height: 1.5),
                      ),
                    ])),
                    buildElevatedButton(context, 'Detail',
                        onPressed: () =>
                            {Navigator.pushNamed(context, Routes.detailVilla)},
                        width: 90,
                        height: 30,
                        icon: Icons.arrow_forward_rounded,
                        iconPosition: 'right')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
