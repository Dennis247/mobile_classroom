import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_school/model/subject.dart';
import 'package:mobile_school/ui/widgets/subjectWidget.dart';
import 'package:mobile_school/utils/AppStyles.dart';
import 'package:mobile_school/utils/constants.dart';

class SubjectList extends StatelessWidget {
  static final routeName = "subjectlist";
  @override
  Widget build(BuildContext context) {
    final allSUbjects = Subject.getSubjects();
    final sz = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Academics",
          style: AppStyle.headerTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Container(
        width: sz.width,
        height: sz.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
            ),
            itemCount: allSUbjects.length,
            itemBuilder: (BuildContext context, int index) {
              return SubjectWidget(
                subject: allSUbjects[index],
                sz: sz,
              );
            },
          ),
        ),
      ),
    );
  }
}
