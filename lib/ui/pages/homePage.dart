import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mobile_school/utils/AppStyles.dart';
import 'package:mobile_school/utils/constants.dart';

import 'academics/subjectListPage.dart';

class HomePage extends StatelessWidget {
  static final routeName = "homePgae";

  _buildRowWidget(double width, double height, IconData iconData, String title,
      Color color, Function function) {
    return GestureDetector(
      onTap: function,
      child: Card(
        elevation: 5,
        child: MaterialButton(
          onPressed: function,
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    iconData,
                    size: 30,
                    color: color,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: AppStyle.normalTexttSTyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: mQ.height,
        width: mQ.width,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildRowWidget(mQ.width * 0.3, mQ.height * 0.2,
                      FontAwesomeIcons.running, "Profile", Colors.green, () {
                    Navigator.of(context).pushNamed("routeName");
                  }),
                  _buildRowWidget(
                      mQ.width * 0.3,
                      mQ.height * 0.2,
                      FontAwesomeIcons.music,
                      "Announcements",
                      Colors.red,
                      () {}),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildRowWidget(
                      mQ.width * 0.3,
                      mQ.height * 0.2,
                      FontAwesomeIcons.chartLine,
                      "Performance",
                      Colors.yellow,
                      () {}),
                  _buildRowWidget(mQ.width * 0.3, mQ.height * 0.2, Icons.school,
                      "Academics", Colors.blue, () {
                    Navigator.of(context).pushNamed(SubjectList.routeName);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
