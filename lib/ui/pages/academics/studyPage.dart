import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_school/data/questionsData.dart';
import 'package:mobile_school/model/question.dart';
import 'package:mobile_school/model/topic.dart';
import 'package:mobile_school/ui/pages/academics/subjcetTopicsPage.dart';
import 'package:mobile_school/ui/pages/academics/topicPage.dart';
import 'package:mobile_school/ui/pages/assessments/currentAssessmentPage.dart';
import 'package:mobile_school/ui/widgets/appScafold.dart';
import 'package:mobile_school/utils/AppStyles.dart';

class StudyPage extends StatelessWidget {
  final Topic topic;
  const StudyPage({Key key, this.topic}) : super(key: key);
  _buildStudyRow(BuildContext context, Size sz, IconData icon, Color color,
      String title, Function function) {
    return Card(
      elevation: 0,
      child: MaterialButton(
        elevation: 5,
        onPressed: function,
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
                  icon,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.of(context).size;
    return AppScaffold(
      title: topic.topicName,
      childWidget: Container(
        alignment: Alignment.center,
        height: sz.height,
        width: sz.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
              children: <Widget>[
                _buildStudyRow(context, sz, FontAwesomeIcons.desktop,
                    Colors.red, "Text Books", () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TopicPage(
                      topic: topic,
                    );
                  }));
                }),
                _buildStudyRow(context, sz, FontAwesomeIcons.chalkboardTeacher,
                    Colors.green, "Assessment", (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return CurrentAssessMentPage(
                      topic: topic,
                      questions: demoQuestions,
                    );
                  }));
                })),
                _buildStudyRow(context, sz, FontAwesomeIcons.book, Colors.blue,
                    "Teacher Note", (() {}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
