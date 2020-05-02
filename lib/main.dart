import 'package:flutter/material.dart';
import 'package:mobile_school/ui/pages/academics/subjcetTopicsPage.dart';
import 'package:mobile_school/ui/pages/homePage.dart';
import 'package:mobile_school/utils/constants.dart';

import 'ui/pages/academics/subjectListPage.dart';
import 'ui/pages/authPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Class Room',
      theme: ThemeData(primaryColor: Constants.primaryColorDark),
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SubjectList.routeName: (context) => SubjectList(),
        SubjectTopics.routeName: (context) => SubjectTopics()
      },
    );
  }
}
