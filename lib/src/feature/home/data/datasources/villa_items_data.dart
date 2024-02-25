import 'package:flutter/material.dart';

import '../../../../core/constant/app_constant.dart';
import '../../presentation/widgets/villa_card_widget.dart';
import '../models/facility_models.dart';

class VillaItems {
  static List<VillaCard> villas = [
    VillaCard(
      id: '1',
      thumbnailUrl: '${AppConstants.urlImage}/villa-thumbnail.png',
      title: 'Tulip 1',
      code: 'VMS-001',
      description:
          'Apartemen dengan 4 Kamar tidur, 2 Kamar mandi, ada kolam renang private',
      facilities: [
        ListFacilities(icon: Icons.people_outline, title: '7 Orang'),
        ListFacilities(icon: Icons.bed_outlined, title: '4 Kamar'),
        ListFacilities(icon: Icons.pool_outlined, title: 'Kolam Renang'),
        ListFacilities(icon: Icons.wifi, title: 'Wifi'),
      ],
    ),
    VillaCard(
      id: '1',
      thumbnailUrl: '${AppConstants.urlImage}/villa-thumbnail.png',
      title: 'Tulip 1',
      code: 'VMS-001',
      description:
          'Apartemen dengan 4 Kamar tidur, 2 Kamar mandi, ada kolam renang private',
      facilities: [
        ListFacilities(icon: Icons.people_outline, title: '7 Orang'),
        ListFacilities(icon: Icons.bed_outlined, title: '4 Kamar'),
        ListFacilities(icon: Icons.pool_outlined, title: 'Kolam Renang'),
        ListFacilities(icon: Icons.wifi, title: 'Wifi'),
      ],
    ),
    VillaCard(
      id: '1',
      thumbnailUrl: '${AppConstants.urlImage}/villa-thumbnail.png',
      title: 'Tulip 1',
      code: 'VMS-001',
      description:
          'Apartemen dengan 4 Kamar tidur, 2 Kamar mandi, ada kolam renang private',
      facilities: [
        ListFacilities(icon: Icons.people_outline, title: '7 Orang'),
        ListFacilities(icon: Icons.bed_outlined, title: '4 Kamar'),
        ListFacilities(icon: Icons.pool_outlined, title: 'Kolam Renang'),
        ListFacilities(icon: Icons.wifi, title: 'Wifi'),
      ],
    ),
  ];
}
