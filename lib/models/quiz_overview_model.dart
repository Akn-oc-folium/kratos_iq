import 'dart:convert';

QuizOverview quizOverviewFromJson(String str) =>
    QuizOverview.fromJson(json.decode(str));

String quizOverviewToJson(QuizOverview data) => json.encode(data.toJson());

class QuizOverview {
  List<QuizDatum> data;
  int code;
  String message;

  QuizOverview({
    required this.data,
    required this.code,
    required this.message,
  });

  factory QuizOverview.fromJson(Map<String, dynamic> json) => QuizOverview(
        data: List<QuizDatum>.from(
            json["data"].map((x) => QuizDatum.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class QuizDatum {
  int lectureNumber;
  String lectureId;
  String title;
  int totalQuestions;

  QuizDatum({
    required this.lectureNumber,
    required this.lectureId,
    required this.title,
    required this.totalQuestions,
  });

  factory QuizDatum.fromJson(Map<String, dynamic> json) => QuizDatum(
        lectureNumber: json["lecture_number"],
        lectureId: json["lecture_id"],
        title: json["title"],
        totalQuestions: json["total_questions"],
      );

  Map<String, dynamic> toJson() => {
        "lecture_number": lectureNumber,
        "lecture_id": lectureId,
        "title": title,
        "total_questions": totalQuestions,
      };
}
