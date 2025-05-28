import 'dart:convert';

QuizSet quizSetFromJson(String str) => QuizSet.fromJson(json.decode(str));

String quizSetToJson(QuizSet data) => json.encode(data.toJson());

class QuizSet {
  Data data;
  int code;
  String message;

  QuizSet({
    required this.data,
    required this.code,
    required this.message,
  });

  factory QuizSet.fromJson(Map<String, dynamic> json) => QuizSet(
        data: Data.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
        "message": message,
      };
}

class Data {
  List<Question> questions;

  Data({
    required this.questions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  String question;
  List<String> options;
  int correctIndex;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        options: List<String>.from(json["options"].map((x) => x)),
        correctIndex: json["correct_index"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x)),
        "correct_index": correctIndex,
      };
}
