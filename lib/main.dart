import 'package:flutter/material.dart';

import 'routes.dart';
import 'src/core/constant/color_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idealis App',
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Open Sans',
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor)
              .copyWith(background: kWhiteColor)),
      initialRoute: Routes.home, //? Set the initial route
      onGenerateRoute: Routes
          .generateRoute, //? Use the generateRoute function from routes.dart
      debugShowCheckedModeBanner: true,
    );
  }
}
