import 'package:mobile_school/utils/constants.dart';

class Topic {
  final String subjectName;
  final String topicName;

  Topic(this.subjectName, this.topicName);

  static List<Topic> getAllTopics = [
    Topic(Constants.maths, "Numbers & Numeration"),
    Topic(Constants.maths, "Basic Operations"),
    Topic(Constants.maths, "Algebraic Processes"),
    Topic(Constants.maths, "Mensuration And Geometry"),
    Topic(Constants.maths, "Stastitics"),
    ///////////////////////////////////////////
    Topic(Constants.english, "Reading & Phonics"),
    Topic(Constants.english, "Grammatical Accuracy"),
    Topic(Constants.english, "Vowels & Consonants"),
    Topic(Constants.english, "Songs & Rhymes"),
    Topic(Constants.english, "Parts of Speech"),
    ///////////////////////////////////////////////
    Topic(Constants.technology, "Introduction to Computer"),
    Topic(Constants.technology, "Basic Computer Operations"),
    Topic(Constants.technology, "Basic Concept of I.T"),

    ///////////////////////////////////////////////
    Topic(Constants.basicScience, "Living Things & Non Living Things"),
    Topic(Constants.basicScience, "Air Pollution"),
    Topic(Constants.basicScience, "Renewable Resources"),
  ];
}
