import 'package:flutter/material.dart';
import 'package:mobile_school/model/subject.dart';
import 'package:mobile_school/utils/constants.dart';

class TopicModule {
  final String subject;
  final String topic;
  final String pdfContent;

  TopicModule({
    @required this.subject,
    @required this.topic,
    @required this.pdfContent,
  });

  static List<TopicModule> getModuleList = [
    TopicModule(subject: null, topic: null, pdfContent: null)
  ];
}
