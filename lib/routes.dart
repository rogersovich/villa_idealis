import 'package:flutter/material.dart';
import 'package:villa_idealis/src/feature/onboarding/presentation/pages/onboarding_pages.dart';
import 'src/feature/example/example_pages.dart';
import 'src/feature/home/presentation/pages/home_pages.dart';
import 'src/feature/villla/presentation/pages/villa_pages.dart';

class Routes {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String detailVilla = '/villa';
  static const String example = '/example';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePages());
      case detailVilla:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => VillaPages(id: args['id']));
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPages());
      case example:
        return MaterialPageRoute(builder: (_) => const ExamplePages());
      default:
        throw const FormatException('Route not found! Check routes again.');
    }
  }
}
