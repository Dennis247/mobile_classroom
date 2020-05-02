import 'package:flutter/material.dart';
import 'package:mobile_school/model/question.dart';
import 'package:mobile_school/model/topic.dart';
import 'package:mobile_school/ui/widgets/appScafold.dart';
import 'package:mobile_school/utils/AppStyles.dart';
import 'package:mobile_school/utils/constants.dart';

import 'assessmentFinishedPage.dart';

class CurrentAssessMentPage extends StatefulWidget {
  final Topic topic;
  final List<Question> questions;

  const CurrentAssessMentPage({Key key, this.topic, this.questions})
      : super(key: key);
  @override
  _CurrentAssessMentPageState createState() => _CurrentAssessMentPageState();
}

class _CurrentAssessMentPageState extends State<CurrentAssessMentPage> {
  //get topic and get questions belonging to the topic

  final TextStyle _questionStyle = TextStyle(
      color: Constants.primaryColorDark,
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w500);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to quit the ${widget.topic.topicName}? All your progress will be lost."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => AssessmentFinishedPage(
              questions: widget.questions, answers: _answers)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.of(context).size;
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrectAnswers;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }
    return AppScaffold(
      title: "${widget.topic.topicName} Assessment",
      childWidget: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          key: _key,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: sz.height,
              width: sz.width,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Constants.primaryColorDark,
                        child: Text(
                          "${_currentIndex + 1}",
                          style: AppStyle.headerTextStyle,
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          widget.questions[_currentIndex].question,
                          softWrap: true,
                          style: _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ...options.map((option) => RadioListTile(
                              title: Text("$option"),
                              groupValue: _answers[_currentIndex],
                              value: option,
                              onChanged: (value) {
                                setState(() {
                                  _answers[_currentIndex] = option;
                                });
                              },
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                            _currentIndex == (widget.questions.length - 1)
                                ? "Submit"
                                : "Next"),
                        onPressed: _nextSubmit,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
