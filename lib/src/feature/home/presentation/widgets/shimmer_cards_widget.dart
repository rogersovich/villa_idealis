import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerCardsEffect(int counts) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: List.generate(
            counts,
            (index) => Container(
              margin: EdgeInsets.only(
                bottom: 16.0,
                left: 0,
                right: 0,
                top: index == 0 ? 8.0 : 0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              height: 180.0, // Height of each shimmering container
              width: double.infinity,
            ),
          ),
        ),
      ),
    ),
  );
}