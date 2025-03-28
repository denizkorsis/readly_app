import 'package:flutter/material.dart';

//This class contains all the colors in the app
//All variables are static and immutable
//Must be used, when creating a theme or a color
//Should not be used material color values, use this class instead
class AppColors {
  static Color white = const Color(0xFFFFFFFF);
  static Color lightWhite = const Color(0xFFD9D9D9);

  static Color black = const Color(0xFF000000);
  static Color greyishBlack = const Color(0xFF000000).withOpacity(0.58);
  static Color selectedGreen = const Color(0xFF9BE065);
  static Color storyBackgroundColor = const Color(0xFFCED6FE);

  static Color transparent = const Color(0x00FFFFFF);

  static Color greyblack = const Color(0xFF404040);
  static Color pink = const Color(0xFFFFE7E3);
  static Color shadow = const Color(0xFF232323);
  static Color hint = const Color(0xFFA4A4A4);
  static Color grey = const Color(0xFF474747);
  static Color mediumGrey = const Color(0xFF545458);
  static Color lightGrey = const Color(0xFFF6F6F6);
  static Color dark = const Color(0xFF0E0E10);
  static Color red = const Color(0xFFFF2828);
  static Color green = const Color(0xFF32C500);
  static Color purple = const Color(0xFFAD64FF);
  static Color darkGray = const Color(0xFF3E3E3E);
  static Color darkPurple = const Color(0xFF3E2C75);
  //static Color darkPurple = const Color(0xFF3E2C75);
  static Color lightPurple = const Color(0xFF392F74);
  static Color blue = const Color(0xFF006EDF);
  static Color softGrey = const Color(0xFFF6F6F6);
  //static Color darkBlue = const Color(0xFF2F1F62);
  static Color textBlack = const Color(0xFF1C1B1F);
  static Color orange = const Color(0xFFF26950);
  static Color lessOrange = const Color.fromARGB(255, 237, 132, 114);
  static Color secondOrange = const Color(0xFFF65C40);
  static Color softBlack = const Color(0xFF676767);
  static Color navigationBarColor = const Color(0xFFF6F6F6);
  static Color navigationSelectedColor = const Color(0xFF73A2AC);
  //static Color softGrey = const Color(0xFFF6F6F6);
  static Color firstCardColor = const Color(0xFF73A2AC);
  static Color secondCardColor = const Color(0xFFFF8D70);
  static Color thirdCardColor = const Color(0xFF799779);
  static Color appBar = const Color.fromARGB(255, 255, 93, 100);
  static Color appBarsoft = const Color.fromARGB(204, 255, 93, 100);
  static Color appBarlight = const Color.fromARGB(255, 251, 212, 213);

  static Color appBarDark = const Color.fromRGBO(247, 76, 83, 1.0);

  static Color lightBlue = const Color(0xFFCED6FE);
  static Color lightRed = const Color(0xFFFFD8D8);
  static Color lightOrange = const Color(0xFFFFE4CD);
  static Color lightGreen = const Color(0xFFD7FFf2);

  static Color blueWeigher = const Color(0xFF4763EA);
  static Color redWeigher = const Color(0xFFF25959);
  static Color orangeWeigher = const Color(0xFFE07B21);
  static Color greenWeigher = const Color(0xFF48CB9F);
  static Color darkWeigher = const Color(0xFF0E0E10);

  static Color greenWeight = const Color(0xFF48CB9F);
  static Color greyWeight = const Color(0xFFA2A2A2);
  static Color lessDark = const Color(0xFF383838);
  static Color greySettings = const Color(0xFFF3F2F8);

  static Color greenDark = const Color.fromARGB(255, 63, 97, 12);

  static Color app = const Color.fromARGB(255, 255, 0, 61);
  static Color greenButton = const Color.fromARGB(255, 0, 166, 122);
  static Color greyDark = const Color.fromARGB(255, 151, 151, 151);
  static Color appOrange = const Color.fromARGB(255, 247, 158, 27);
  static Color bottomsheet = const Color.fromARGB(255, 244, 244, 244);
  static Color appGreen = const Color.fromARGB(255, 37, 186, 146);

  static LinearGradient gradientOrange = const LinearGradient(
    colors: [
      Color.fromARGB(255, 221, 150, 135),
      Color.fromARGB(255, 255, 255, 255)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.6],
  );
}
