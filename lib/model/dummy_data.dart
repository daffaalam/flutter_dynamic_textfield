import 'quiz.dart';

class DummyData {
  static const String _data = '''
[
  {
    "title": "Full Name",
    "question": "What's your full name?"
  },
  {
    "title": "Email Address",
    "question": "What's your email address?"
  },
  {
    "title": "Phone Number",
    "question": "What's your phone number?"
  },
  {
    "title": "Company",
    "question": "What's your company?",
    "answer": "GITS Indonesia"
  }
]
  ''';
  static List<Quiz> listData = listQuizFromJson(_data);
}
