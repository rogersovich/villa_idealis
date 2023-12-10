import 'package:flutter/material.dart';

import '../../../../core/constant/color_constant.dart';
import '../../../../core/utils/text_util.dart';
import '../../data/models/facility_models.dart';
import '../widgets/image_slider_widget.dart';
import '../widgets/villa_card_widget.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: buildTextCustom(context, 'Home',
            color: kBlackColor, fontSize: 9, weight: 'w600'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {},
          ),

          // Add more IconButton widgets for additional icons
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImageSliderWidget(),
            VillaCard(
              thumbnailUrl:
                  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              title: 'Card Title',
              description: 'This is a sample card description.',
              facilities: [
                ListFacilities(
                    icon: Icons.favorite_border_outlined, title: 'Favorite'),
                ListFacilities(icon: Icons.shower_outlined, title: 'Shower'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
