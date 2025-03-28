import 'package:flutter/material.dart';

//This is a file that contains all the font paths and font weights in the app
//Must be used with TextStyle, TextTheme, etc
enum FontFamily {
  poppins("Poppins");

  const FontFamily(this.family);

  final String family;
}

enum CustomFontWeight {
  bold(FontWeight.w900),
  semiBold(FontWeight.w700),
  medium(FontWeight.w600),
  regular(FontWeight.w500),
  minFRegular(FontWeight.w400),
  light(FontWeight.w300);

  const CustomFontWeight(this.weight);

  final FontWeight weight;
}
