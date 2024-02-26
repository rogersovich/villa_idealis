import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerDetailVillaEffect() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 16.0,
                left: 0,
                right: 0,
                top: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              height: 180.0, // Height of each shimmering container
              width: double.infinity,
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 16.0,
                left: 0,
                right: 0,
                top: 0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0), // Rounded corners
              ),
              height: 20.0, // Height of each shimmering container
              width: 180,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: List.generate(
                3,
                (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 8.0,
                              left: 0,
                              right: 0,
                              top: 0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(5.0), // Rounded corners
                            ),
                            height: 20.0, // Height of each shimmering container
                            width: 150,
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 8.0,
                              left: 0,
                              right: 0,
                              top: 0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(5.0), // Rounded corners
                            ),
                            height: 20.0, // Height of each shimmering container
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    )),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 16.0,
                left: 0,
                right: 0,
                top: 0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0), // Rounded corners
              ),
              height: 20.0, // Height of each shimmering container
              width: 180,
            ),
          ),
          Column(
            children: List.generate(
              2,
              (index) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 12.0,
                    left: 0,
                    right: 0,
                    top: index == 0 ? 8.0 : 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  height: 20.0, // Height of each shimmering container
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 16.0,
                left: 0,
                right: 0,
                top: 0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0), // Rounded corners
              ),
              height: 20.0, // Height of each shimmering container
              width: 180,
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 6,
            ),
            itemCount: 4,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
}
