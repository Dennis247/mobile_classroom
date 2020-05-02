import 'package:flutter/material.dart';
import 'package:mobile_school/model/question.dart';
import 'package:mobile_school/model/subject.dart';
import 'package:mobile_school/ui/pages/academics/studyPage.dart';
import 'package:mobile_school/ui/pages/academics/subjcetTopicsPage.dart';
import 'package:mobile_school/ui/pages/academics/subjectListPage.dart';
import 'package:mobile_school/ui/widgets/appScafold.dart';
import 'package:mobile_school/utils/AppStyles.dart';

class CheckAnswersPage extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  const CheckAnswersPage({Key key, this.questions, this.answers})
      : super(key: key);

  Widget _buildItem(BuildContext context, int index) {
    final String subjectName = questions[0].subject;
    final subject =
        Subject.getSubjects().firstWhere((s) => s.subjectName == subjectName);
    if (index == questions.length) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return SubjectTopics(subject: subject);
                    }));
                  },
                  child: Text(
                    "Back To Subject",
                    style: AppStyle.normalTexttSTyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SubjectList();
                    }));
                  },
                  child: Text(
                    "Back To Home",
                    style: AppStyle.normalTexttSTyle,
                  ),
                  color: Colors.green,
                )
              ],
            ),
          ],
        ),
      );
    }
    Question question = questions[index];
    bool correct = question.correctAnswer == answers[index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              question.question,
              style: AppStyle.normalTexttSTyle,
            ),
            SizedBox(height: 5.0),
            Text(
              "${answers[index]}",
              style: TextStyle(
                  color: correct ? Colors.green : Colors.red,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            correct
                ? Container()
                : Text.rich(
                    TextSpan(children: [
                      TextSpan(text: "Answer: "),
                      TextSpan(
                          text: question.correctAnswer,
                          style: TextStyle(fontWeight: FontWeight.w500))
                    ]),
                    style: TextStyle(fontSize: 16.0),
                  )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.of(context).size;
    return AppScaffold(
      title: "Answers",
      childWidget: Container(
        height: sz.height,
        width: sz.width,
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: questions.length + 1,
          itemBuilder: _buildItem,
        ),
      ),
    );
  }
}
