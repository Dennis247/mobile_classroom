import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AppStyle {
  static final normalTexttSTyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Constants.primaryColorDark,
      fontFamily: 'Poppins',
      fontSize: 12,
    ),
  );

  static final headerTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: Constants.primaryColorLight,
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w500),
  );
}
