import 'dart:convert';

LectureOverview lectureOverviewFromJson(String str) =>
    LectureOverview.fromJson(json.decode(str));

String lectureOverviewToJson(LectureOverview data) =>
    json.encode(data.toJson());

class LectureOverview {
  List<Datum> data;
  int code;
  String message;

  LectureOverview({
    required this.data,
    required this.code,
    required this.message,
  });

  factory LectureOverview.fromJson(Map<String, dynamic> json) =>
      LectureOverview(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class Datum {
  int lectureNumber;
  String lectureId;
  DateTime date;

  Datum({
    required this.lectureNumber,
    required this.lectureId,
    required this.date,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        lectureNumber: json["lecture_number"],
        lectureId: json["lecture_id"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "lecture_number": lectureNumber,
        "lecture_id": lectureId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
