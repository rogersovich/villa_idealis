import 'package:flutter/material.dart';
import 'src/feature/example/example_pages.dart';
import 'src/feature/home/presentation/pages/home_pages.dart';
import 'src/feature/villla/presentation/pages/villa_pages.dart';

class Routes {
  static const String home = '/';
  static const String detailVilla = '/villa';
  static const String example = '/example';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePages());
      case detailVilla:
        return MaterialPageRoute(builder: (_) => const VillaPages());
      case example:
        return MaterialPageRoute(builder: (_) => const ExamplePages());
      default:
        throw const FormatException('Route not found! Check routes again.');
    }
  }
}
