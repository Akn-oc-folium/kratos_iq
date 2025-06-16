// To parse this JSON data, do
//
//     final flashcardsOverviewModel = flashcardsOverviewModelFromJson(jsonString);

import 'dart:convert';

FlashcardsOverviewModel flashcardsOverviewModelFromJson(String str) =>
    FlashcardsOverviewModel.fromJson(json.decode(str));

String flashcardsOverviewModelToJson(FlashcardsOverviewModel data) =>
    json.encode(data.toJson());

class FlashcardsOverviewModel {
  final List<FlashcardDatum>? data;
  final int? code;
  final String? message;

  FlashcardsOverviewModel({
    this.data,
    this.code,
    this.message,
  });

  factory FlashcardsOverviewModel.fromJson(Map<String, dynamic> json) =>
      FlashcardsOverviewModel(
        data: json["data"] == null
            ? []
            : List<FlashcardDatum>.from(
                json["data"]!.map((x) => FlashcardDatum.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class FlashcardDatum {
  final int? lectureNumber;
  final String? lectureId;
  final String? label;
  final String? content;

  FlashcardDatum({
    this.lectureNumber,
    this.lectureId,
    this.label,
    this.content,
  });

  factory FlashcardDatum.fromJson(Map<String, dynamic> json) => FlashcardDatum(
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
