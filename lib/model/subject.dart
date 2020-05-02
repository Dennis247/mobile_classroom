import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_school/utils/constants.dart';

class Subject {
  final String subjectName;
  final IconData icon;
  final Color color;

  Subject(this.subjectName, this.icon, this.color);

  static List<Subject> getSubjects() {
    List<Subject> subjects = [
      Subject(
        Constants.basicScience,
        FontAwesomeIcons.digitalOcean,
        Colors.red,
      ),
      Subject(Constants.maths, FontAwesomeIcons.calculator, Colors.green),
      Subject(Constants.english, FontAwesomeIcons.book, Colors.blue),
      Subject(Constants.technology, Icons.desktop_mac, Colors.red),
      Subject(Constants.religion, FontAwesomeIcons.pray, Colors.orange),
      Subject(Constants.civic, FontAwesomeIcons.chalkboardTeacher,
          Colors.deepPurple),
      Subject(
          Constants.quantativeReasoning, FontAwesomeIcons.chartBar, Colors.red),
      Subject(
          Constants.verbalAptitude, FontAwesomeIcons.chartPie, Colors.green),
    ];

    return subjects;
  }
}
