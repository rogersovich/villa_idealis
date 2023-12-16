import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import '../../../../core/constant/color_constant.dart';
import '../../data/datasources/villa_images_data.dart';
import 'modal_all_image_widget.dart';

class VillaImageCarouselWidget extends StatefulWidget {
  const VillaImageCarouselWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VillaImageCarouselWidgetState createState() =>
      _VillaImageCarouselWidgetState();
}

class _VillaImageCarouselWidgetState extends State<VillaImageCarouselWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    const List<String> imgList = VillaImageData.imgList;
    final marginHozCarousel = getProportionateScreenWidth(context, 10);
    final BorderRadius roundedImage =
        BorderRadius.circular(getProportionateScreenWidth(context, 10));
    final double dotWidth = getProportionateScreenWidth(context, 7);
    final double dotHeight = getProportionateScreenWidth(context, 7);

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: EdgeInsets.only(
                  bottom: 5, left: marginHozCarousel, right: marginHozCarousel),
              child: ClipRRect(
                borderRadius: roundedImage,
                child: Stack(
                  children: <Widget>[
                    Image.asset(item,
                        fit: BoxFit.cover, width: double.maxFinite),
                  ],
                ),
              ),
            ))
        .toList();

    return GestureDetector(
      onTap: () {
        _showModalBottomSheet(context);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.1,
              viewportFraction: 1,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    child: Container(
                      width: _current == entry.key ? 30.0 : dotWidth,
                      height: dotHeight,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: _current == entry.key
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        borderRadius: _current == entry.key
                            ? BorderRadius.circular(5.0)
                            : null,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : kWhiteColor)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const ModalAllImageWidget();
      },
    );
  }
}
