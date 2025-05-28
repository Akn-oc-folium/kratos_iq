import 'dart:convert';

FlashCardOverview flashCardOverviewFromJson(String str) =>
    FlashCardOverview.fromJson(json.decode(str));

String flashCardOverviewToJson(FlashCardOverview data) =>
    json.encode(data.toJson());

class FlashCardOverview {
  List<FlashCardDatum> data;
  int code;
  String message;

  FlashCardOverview({
    required this.data,
    required this.code,
    required this.message,
  });

  factory FlashCardOverview.fromJson(Map<String, dynamic> json) =>
      FlashCardOverview(
        data: List<FlashCardDatum>.from(
            json["data"].map((x) => FlashCardDatum.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class FlashCardDatum {
  int lectureNumber;
  String lectureId;
  String label;
  String content;

  FlashCardDatum({
    required this.lectureNumber,
    required this.lectureId,
    required this.label,
    required this.content,
  });

  factory FlashCardDatum.fromJson(Map<String, dynamic> json) => FlashCardDatum(
        lectureNumber: json["lecture_number"],
        lectureId: json["lecture_id"],
        label: json["label"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "lecture_number": lectureNumber,
        "lecture_id": lectureId,
        "label": label,
        "content": content,
      };
}
