// To parse this JSON data, do
//
//     final flashcardsByLectureModel = flashcardsByLectureModelFromJson(jsonString);

import 'dart:convert';

FlashcardsByLectureModel flashcardsByLectureModelFromJson(String str) =>
    FlashcardsByLectureModel.fromJson(json.decode(str));

String flashcardsByLectureModelToJson(FlashcardsByLectureModel data) =>
    json.encode(data.toJson());

class FlashcardsByLectureModel {
  final Data? data;
  final int? code;
  final String? message;

  FlashcardsByLectureModel({
    this.data,
    this.code,
    this.message,
  });

  factory FlashcardsByLectureModel.fromJson(Map<String, dynamic> json) =>
      FlashcardsByLectureModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "code": code,
        "message": message,
      };
}

class Data {
  final int? lectureNumber;
  final String? title;
  final List<FlashCard>? flashCards;

  Data({
    this.lectureNumber,
    this.title,
    this.flashCards,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lectureNumber: json["lecture_number"],
        title: json["title"],
        flashCards: json["flash_cards"] == null
            ? []
            : List<FlashCard>.from(
                json["flash_cards"]!.map((x) => FlashCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lecture_number": lectureNumber,
        "title": title,
        "flash_cards": flashCards == null
            ? []
            : List<dynamic>.from(flashCards!.map((x) => x.toJson())),
      };
}

class FlashCard {
  final String? title;
  final String? content;

  FlashCard({
    this.title,
    this.content,
  });

  factory FlashCard.fromJson(Map<String, dynamic> json) => FlashCard(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
