import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/constant/app_constant.dart';
import 'package:villa_idealis/src/core/constant/style_constant.dart';
import 'package:villa_idealis/src/core/models/villa_blok_models.dart';
import 'package:villa_idealis/src/core/models/villa_recommendation_models.dart';
import 'package:villa_idealis/src/core/utils/button_util.dart';
import 'package:villa_idealis/src/feature/home/data/models/facility_models.dart';

import '../../../../../routes.dart';
import '../../../../core/constant/color_constant.dart';
import '../../../../core/utils/text_util.dart';
// import '../../data/datasources/villa_items_data.dart';
import '../widgets/image_slider_widget.dart';
import '../widgets/villa_card_widget.dart';

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
    _villaRecommendationsFuture = fetchVillaRecommendations();
    _villaBloksFuture = fetchVillaBloks();
  }

  Future<VillaRecommendationsReponse> fetchVillaRecommendations() async {
    try {
      final response =
          await dio.get('${AppConstants.apiUrl}/villas/rekomendasi');

      if (response.statusCode == 200) {
        // Parse the JSON response using the VillaRecommendationsReponse model
        return VillaRecommendationsReponse.fromJson(response.data);
      } else {
        // If the API returns an error status code, throw an exception
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors, including DioError for network-related issues
      throw Exception('Error: $error');
    }
  }

  Future<VillaBloksReponse> fetchVillaBloks() async {
    try {
      final response = await dio.get('${AppConstants.apiUrl}/villas/blok');

      if (response.statusCode == 200) {
        // Parse the JSON response using the VillaBloksReponse model
        return VillaBloksReponse.fromJson(response.data);
      } else {
        // If the API returns an error status code, throw an exception
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors, including DioError for network-related issues
      throw Exception('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets paddingCard = EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(context, 8),
        horizontal: getProportionateScreenWidth(context, 12));

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
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {
              Navigator.pushNamed(context, Routes.example);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  VillaRecommendationsReponse villasResponse = snapshot.data!;

                  // You can now use the list of villas to display them in your UI
                  List<Widget> villaWidgets = villasResponse.data.map((villa) {
                    return VillaCard(
                      thumbnailUrl: '${AppConstants.apiUrl}/${villa.thumbnail}',
                      title: villa.code!, // Adjust as needed
                      description: villa.description!,
                      isImageOnline: true,
                      facilities: villa.facilities
                          .map((facility) => ListFacilities(
                              icon: getIconData(facility.icon!),
                              title: facility.title!))
                          .toList(),
                    );
                  }).toList();

                  return SingleChildScrollView(
                    child: Column(
                      children: villaWidgets,
                    ),
                  );
                } else {
                  // Handle the case where there is data but it's empty
                  return const Center(child: Text('No data available'));
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(context, 10)),
              child: buildOutlinedButton(context, "Lihat lebih banyak",
                  onPressed: () => {}, width: double.infinity, height: 34),
            ),
            FutureBuilder<VillaBloksReponse>(
              future: _villaBloksFuture, // Use the future here
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Loading state
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // Error state
                } else if (snapshot.hasData) {
                  VillaBloksReponse villasResponse = snapshot.data!;
                  // in above column please mapping with "villasResponse.data"
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
                                buildTextCustom(
                                    context, 'Blok ${villaBlock.block}',
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
                                    thumbnailUrl:
                                        '${AppConstants.apiUrl}/${villa.thumbnail}',
                                    title: villa.code!,
                                    description: villa.description!,
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
                } else {
                  return const Text(
                      'Unknown error'); // Fallback for unknown states
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
