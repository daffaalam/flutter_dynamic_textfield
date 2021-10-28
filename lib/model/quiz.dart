import 'dart:convert';

List<Quiz> listQuizFromJson(String str) {
  return List<Quiz>.from(
    json.decode(str).map((e) => Quiz.fromMap(e)),
  );
}

String listQuizToJson(List<Quiz> data) {
  return json.encode(
    List<dynamic>.from(data.map((e) => e.toMap())),
  );
}

class Quiz {
  Quiz({
    required this.title,
    required this.question,
    this.answer,
  });

  String title;
  String question;
  String? answer;

  factory Quiz.fromJson(String str) {
    return Quiz.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      title: map['title'],
      question: map['question'],
      answer: map['answer'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'question': question,
      'answer': answer,
    };
  }

  @override
  String toString() {
    return toJson();
  }
}
