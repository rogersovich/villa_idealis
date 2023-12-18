import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/utils/button_util.dart';

import '../../../../../routes.dart';
import '../../../../core/constant/color_constant.dart';
import '../../../../core/utils/text_util.dart';
import '../../data/datasources/villa_items_data.dart';
import '../widgets/image_slider_widget.dart';
import '../widgets/villa_card_widget.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  // ignore: unused_field
  int _current = 0;
  final CarouselController _controller = CarouselController();

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
            ...VillaItems.villas.map((villa) {
              return VillaCard(
                thumbnailUrl: villa.thumbnailUrl,
                title: villa.title,
                description: villa.description,
                facilities: villa.facilities,
              );
            }).toList(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(context, 10)),
              child: buildOutlinedButton(context, "Lihat lebih banyak",
                  onPressed: () => {}, width: double.infinity, height: 34),
            ),
            Padding(
              padding: paddingCard,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTextCustom(context, 'Blok Mawar',
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
              items: VillaItems.villas,
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                viewportFraction: 0.9,
                aspectRatio: 0.97,
                padEnds: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
