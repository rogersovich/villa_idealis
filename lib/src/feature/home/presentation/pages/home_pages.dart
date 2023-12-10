import 'package:flutter/material.dart';

import '../../../../core/constant/color_constant.dart';
import '../../../../core/utils/text_util.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: buildTextCustom(context, 'Home',
            color: kBlackColor, fontSize: 9, weight: 'w600'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.login_rounded),
            onPressed: () {},
          ),

          // Add more IconButton widgets for additional icons
        ],
      ),
      body: SingleChildScrollView(
        child: buildTextCustom(context, 'Hellow Home'),
      ),
    );
  }
}
