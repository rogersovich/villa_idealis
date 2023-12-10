// features/home/presentation/image_slider_widget.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:villa_idealis/size_config.dart';
import '../../../../core/constant/color_constant.dart';
import '../../data/datasources/image_data.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageSliderWidgetState createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    const List<String> imgList = ImageData.imgList;
    final marginHozCarousel = getProportionateScreenWidth(context, 10);

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: EdgeInsets.only(
                  bottom: 5, left: marginHozCarousel, right: marginHozCarousel),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 0.0),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.1,
            viewportFraction: 1,
            aspectRatio: 2.2,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastEaseInToSlowEaseOut,
                child: Container(
                  width: _current == entry.key ? 30.0 : 10.0,
                  height: 10.0,
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
                            : kPrimaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
