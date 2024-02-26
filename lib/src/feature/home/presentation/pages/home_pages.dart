import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/models/villa_blok_models.dart';
import 'package:villa_idealis/src/core/models/villa_recommendation_models.dart';

import '../../../../../routes.dart';
import '../../../../core/constant/color_constant.dart';
import '../../../../core/utils/text_util.dart';
import '../../services/villas_service.dart';
import '../widgets/image_slider_widget.dart';
import '../widgets/shimmer_cards_widget.dart';
import '../widgets/villa_bloks_widget.dart';
import '../widgets/villa_recommendations_widget.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  Dio dio = Dio();
  late Future<VillaRecommendationsReponse> _villaRecommendationsFuture;
  late Future<VillaBloksReponse> _villaBloksFuture;

  @override
  void initState() {
    super.initState();
    VillasService villasService = VillasService();
    _villaRecommendationsFuture = villasService.fetchVillaRecommendations();
    _villaBloksFuture = villasService.fetchVillaBloks();
  }

  Future<void> _handleRefresh() async {
    VillasService villasService = VillasService();
    setState(() {
      //todo Reassign the futures to trigger fetching data again
      _villaRecommendationsFuture = villasService.fetchVillaRecommendations();
      _villaBloksFuture = villasService.fetchVillaBloks();
    });
    //? You may want to wait for both futures to complete before completing the refresh
    await Future.wait([_villaRecommendationsFuture, _villaBloksFuture]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        surfaceTintColor: kWhiteColor,
        title: buildTextCustom(context, 'Beranda',
            color: kBlackColor, fontSize: 16, weight: 'w700'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => Navigator.pushNamed(context, Routes.onboarding),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.account_circle_rounded),
        //     onPressed: () {
        //       Navigator.pushNamed(context, Routes.example);
        //     },
        //   ),
        // ],
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: getProportionateScreenWidth(context, 8)),
          child: Column(
            children: [
              const ImageSliderWidget(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(context, 8)),
                child: buildTextCustom(context, "Rekomendasi Villa Terbaik",
                    weight: 'w700', fontSize: 18),
              ),
              FutureBuilder<VillaRecommendationsReponse>(
                future: _villaRecommendationsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return buildShimmerCardsEffect(3);
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    VillaRecommendationsReponse villasResponse = snapshot.data!;

                    return VillaRecommendationsWidget(
                        villasResponse: villasResponse);
                  } else {
                    // Handle the case where there is data but it's empty
                    return const Center(child: Text('No data available'));
                  }
                },
              ),
              FutureBuilder<VillaBloksReponse>(
                future: _villaBloksFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return buildShimmerCardsEffect(1);
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    VillaBloksReponse villasResponse = snapshot.data!;

                    return VillaBloksWidget(villasResponse: villasResponse);
                  } else {
                    return const Text('Unknown error');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
