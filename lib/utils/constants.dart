import 'package:flutter/material.dart';

class Constants {
  static final Color primaryColorLight = Colors.white;
  static final Color primaryColorDark = Colors.black;

  //demo Subjects
  static final String maths = "Maths";
  static final String english = "English";
  static final String technology = "Technology";
  static final String religion = "Religion";
  static final String civic = "Civic";
  static final String quantativeReasoning = "Quantative Reasoming";
  static final String verbalAptitude = "Verbal Aptitude";
  static final String basicScience = "Science";

  //Science
  static final String mammals = "Mammals";
  static final String livingthings = "Living Things & Non Living Things";
  static final String resources = "Natural Resources";

  //Maths
  static final String numbersNumeration = "Numbers & Numeration";
  static final String basicOperation = "Basic Operation";
  static final String algebraicProcess = "Algebraic Process";
  static final String mensurationGometry = "Mensuration & Gometry";
  static final String stastitics = "Stastitics";
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}
