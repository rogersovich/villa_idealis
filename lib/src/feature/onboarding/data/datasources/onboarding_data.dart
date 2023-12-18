import 'package:flutter/material.dart';

class OnboardingData {
  static final List<Boarding> boardings = [
    Boarding(
      imageUrl: 'welcome-1.png',
      title: 'Cekin Villa',
      isLast: false,
      description: const <TextSpan>[
        TextSpan(
          text: 'Di saat sudah mulai merasa mumet, \n',
        ),
        TextSpan(
          text: 'waktunya rehat sejenak dan nikmati \n',
        ),
        TextSpan(
          text: 'suasana baru bersama Kami!',
        ),
      ],
    ),
    Boarding(
      imageUrl: 'welcome-2.png',
      title: 'Cekin Villa',
      isLast: false,
      description: const <TextSpan>[
        TextSpan(
          text: 'Staycation di Bogor terasa nyaman, \n',
        ),
        TextSpan(
          text: 'hangat, dan lebih akrab. \n\n',
        ),
        TextSpan(
          text: 'Penginapan villa murah dengan pelayanan \n',
        ),
        TextSpan(
          text: 'terbaik. Cek info penginapan terdekat, fasilitas yang \n',
        ),
        TextSpan(
          text: 'lengkap dan harga yang terjangkau.',
        ),
      ],
    ),
    Boarding(
      imageUrl: 'welcome-1.png',
      title: 'Cekin Villa',
      isLast: true,
      description: const <TextSpan>[
        TextSpan(
          text: 'Di saat sudah mulai merasa mumet, \n',
        ),
        TextSpan(
          text: 'waktunya rehat sejenak dan nikmati \n',
        ),
        TextSpan(
          text: 'suasana baru bersama Kami!',
        ),
      ],
    ),
  ];
}

class Boarding {
  final String imageUrl;
  final String title;
  final bool isLast;
  final List<InlineSpan> description;

  Boarding({
    required this.imageUrl,
    required this.title,
    required this.isLast,
    required this.description,
  });
}
