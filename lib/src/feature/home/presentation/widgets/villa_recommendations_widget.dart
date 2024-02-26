// Import necessary packages
import 'package:flutter/material.dart';
import 'package:villa_idealis/src/feature/home/presentation/widgets/villa_card_widget.dart';

import '../../../../core/constant/style_constant.dart';
import '../../../../core/models/villa_recommendation_models.dart';
import '../../../../core/utils/button_util.dart';
import '../../data/models/facility_models.dart';

class VillaRecommendationsWidget extends StatelessWidget {
  final VillaRecommendationsReponse villasResponse;

  const VillaRecommendationsWidget({super.key, required this.villasResponse});

  @override
  Widget build(BuildContext context) {
    List villaWidgets = villasResponse.data.map((villa) {
      return VillaCard(
        id: villa.id!.toString(),
        thumbnailUrl: villa.thumbnail!,
        title: villa.subCategory!.title!,
        description: villa.description!,
        code: villa.code!,
        isImageOnline: true,
        facilities: villa.facilities
            .map((facility) => ListFacilities(
                icon: getIconData(facility.icon!), title: facility.title!))
            .toList(),
      );
    }).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          ...villaWidgets,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: buildOutlinedButton(context, "Lihat lebih banyak",
                onPressed: () => {}, width: double.infinity, height: 34),
          ),
        ],
      ),
    );
  }
}
