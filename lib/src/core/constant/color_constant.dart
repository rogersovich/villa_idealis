import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color kPrimaryColor = HexColor('#2483fb');
Color kSecondaryColor = HexColor('#FCC419');
Color kWhiteColor = HexColor('#FFFFFF');
Color kGrayColor = HexColor('#BDBDBD');
Color kBlackColor = HexColor('#030712');
Color kErrorColor = HexColor('#dc2626');
Color kBorderColor = HexColor('#404040');
Color kBorderColorActive = HexColor('#2483fb');
Color kBorderColorError = HexColor('#dc2626');

const int _primaryColorValue = 0xFF2483fb;
MaterialColor kPrimaryColors = MaterialColor(
  _primaryColorValue,
  <int, Color>{
    50: HexColor('#e5f0ff'),
    100: HexColor('#bddafe'),
    200: HexColor('#92c1fd'),
    300: HexColor('#66a8fc'),
    400: HexColor('#4596fc'),
    500: HexColor('#2483fb'),
    600: HexColor('#207bfa'),
    700: HexColor('#1b70fa'),
    800: HexColor('#1666f9'),
    900: HexColor('#0d53f8'),
  },
);