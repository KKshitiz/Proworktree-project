import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kBrandHeadingStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 40,
  ),
);

const String kDefaultUserImageUrl =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/User_font_awesome.svg/1200px-User_font_awesome.svg.png';

const List<Color> kUserCardGradient = [
  Color.fromARGB(255, 41, 49, 70),
  Color.fromARGB(255, 53, 61, 82),
  Color.fromARGB(255, 66, 73, 92),
];
