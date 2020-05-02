import 'package:flutter/material.dart';
import 'package:mobile_school/model/subject.dart';
import 'package:mobile_school/ui/pages/academics/subjcetTopicsPage.dart';
import 'package:mobile_school/utils/AppStyles.dart';

class SubjectWidget extends StatelessWidget {
  final Subject subject;
  final Size sz;

  const SubjectWidget({Key key, this.subject, this.sz}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: MaterialButton(
        elevation: 5,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SubjectTopics(subject: subject);
          }));
        },
        color: Colors.white,
        child: Container(
          width: sz.width * 0.4,
          height: sz.height * 0.2,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  subject.icon,
                  size: 30,
                  color: subject.color,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  subject.subjectName,
                  style: AppStyle.normalTexttSTyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
