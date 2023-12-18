// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import 'package:villa_idealis/src/core/utils/button_util.dart';
import 'package:villa_idealis/src/core/utils/image_util.dart';
import 'package:villa_idealis/src/core/utils/text_util.dart';
import 'package:villa_idealis/src/core/utils/widget_util.dart';

import '../../../../../routes.dart';
import '../../../../core/constant/color_constant.dart';
import '../../data/datasources/onboarding_data.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({Key? key}) : super(key: key);

  @override
  _OnboardingPagesState createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: OnboardingData.boardings.map((Boarding board) {
                  return buildContentBoard(board);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: getProportionateScreenWidth(context, 40),
        alignment: Alignment.center,
        padding:
            EdgeInsets.only(bottom: getProportionateScreenWidth(context, 12)),
        child: buildDotIndicator(context),
      ),
    );
  }

  Widget buildContentBoard(Boarding board) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildImage(context, board.imageUrl,
            width: double.infinity, height: 100, fit: BoxFit.contain),
        buildTextCustom(context, board.title, weight: 'w700', fontSize: 20),
        buildSpacing(context, size: 5),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(context, 24)),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(context, 14),
                  color: kBlackColor,
                  height: 1.1,
                  fontWeight: FontWeight.w400),
              children: board.description,
            ),
          ),
        ),
        if (board.isLast == true)
          Column(
            children: [
              buildSpacing(context, size: 8),
              buildElevatedButton(context, "Mengerti",
                  onPressed: () => Navigator.pushNamed(context, Routes.home),
                  width: 130)
            ],
          )
      ],
    );
  }

  Widget buildDotIndicator(BuildContext context) {
    final double dotWidth = getProportionateScreenWidth(context, 10);
    final double dotHeight = getProportionateScreenWidth(context, 10);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(OnboardingData.boardings.length, (index) {
        return AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastEaseInToSlowEaseOut,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(context, 6)),
            width: _currentPage == index ? 30.0 : dotWidth,
            height: dotHeight,
            decoration: BoxDecoration(
              shape:
                  _currentPage == index ? BoxShape.rectangle : BoxShape.circle,
              borderRadius:
                  _currentPage == index ? BorderRadius.circular(5.0) : null,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : kPrimaryColor)
                  .withOpacity(_currentPage == index ? 0.9 : 0.4),
            ),
          ),
        );
      }),
    );
  }
}
