// Import necessary packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:villa_idealis/src/feature/home/presentation/widgets/villa_card_widget.dart';

import '../../../../../size_config.dart';
import '../../../../core/constant/style_constant.dart';
import '../../../../core/models/villa_blok_models.dart';
import '../../../../core/utils/button_util.dart';
import '../../../../core/utils/text_util.dart';
import '../../data/models/facility_models.dart';

class VillaBloksWidget extends StatelessWidget {
  final VillaBloksReponse villasResponse;

  const VillaBloksWidget({super.key, required this.villasResponse});

  @override
  Widget build(BuildContext context) {
    final EdgeInsets paddingCard = EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(context, 8),
        horizontal: getProportionateScreenWidth(context, 12));

    return ListView.builder(
      itemCount: villasResponse.data.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var villaBlock = villasResponse.data[index];
        return Column(
          children: [
            Padding(
              padding: paddingCard,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTextCustom(context, 'Blok ${villaBlock.block}',
                      weight: 'w700', fontSize: 16),
                  buildTextButton(context, 'Lebih banyak',
                      onPressed: () => {},
                      width: 120,
                      icon: Icons.arrow_forward_rounded,
                      iconPosition: 'right')
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                viewportFraction: 0.9,
                aspectRatio: 1.2,
                padEnds: false,
              ),
              items: villaBlock.villas.map<Widget>((villa) {
                return Builder(
                  builder: (BuildContext context) {
                    return VillaCard(
                      id: villa.id!.toString(),
                      thumbnailUrl: villa.thumbnail!,
                      title: villaBlock.block!,
                      description: villa.description!,
                      code: villa.code!,
                      isImageOnline: true,
                      facilities: villa.facilities
                          .map((facility) => ListFacilities(
                              icon: getIconData(facility.icon!),
                              title: facility.title!))
                          .toList(),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
