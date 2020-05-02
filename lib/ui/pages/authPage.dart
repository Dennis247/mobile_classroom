import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_school/ui/pages/homePage.dart';
import 'package:mobile_school/utils/constants.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Constants.primaryColorLight,
        width: mediaQuery.width,
        height: mediaQuery.height,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: ListView(
            children: <Widget>[
              Icon(
                Icons.school,
                size: 100,
              ),
              Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Constants.primaryColorDark,
                      fontFamily: 'Poppins',
                      fontSize: 26),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              Text(
                'Class Activities just got easier with just a Click Away',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Constants.primaryColorDark,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.3,
              ),
              MaterialButton(
                height: 48,
                elevation: 2.0,
                minWidth: mediaQuery.width,
                onPressed: () {},
                child: Text('SIGN UP',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Constants.primaryColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                    side: BorderSide(
                        color: Constants.primaryColorDark, width: 2)),
              ),
              SizedBox(
                height: mediaQuery.height * 0.03,
              ),
              MaterialButton(
                height: 48,
                elevation: 2.0,
                minWidth: mediaQuery.width,
                color: Constants.primaryColorDark,
                onPressed: () {
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
                child: Text('LOGIN',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Constants.primaryColorLight,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                    side: BorderSide(
                        color: Constants.primaryColorDark, width: 2)),
              ),
              SizedBox(
                height: mediaQuery.height * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputWidget(String labelText, bool obscureText) {
    return Container(
        decoration: new BoxDecoration(
            color: Color(0xfff4f8fb), borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
          child: TextFormField(
            obscureText: obscureText,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: labelText,
                labelStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                )),
          ),
        ));
  }
}
