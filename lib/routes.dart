import 'package:flutter/material.dart';

import 'src/feature/home/presentation/pages/home_pages.dart';

class Routes {
  static const String home = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePages());
      default:
        throw const FormatException('Route not found! Check routes again.');
    }
  }
}
