import 'dart:convert';

FlashCards flashCardsFromJson(String str) =>
    FlashCards.fromJson(json.decode(str));

String flashCardsToJson(FlashCards data) => json.encode(data.toJson());

class FlashCards {
  Data data;
  int code;
  String message;

  FlashCards({
    required this.data,
    required this.code,
    required this.message,
  });

  factory FlashCards.fromJson(Map<String, dynamic> json) => FlashCards(
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
  List<FlashCard> flashCards;

  Data({
    required this.flashCards,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        flashCards: List<FlashCard>.from(
            json["flash_cards"].map((x) => FlashCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "flash_cards": List<dynamic>.from(flashCards.map((x) => x.toJson())),
      };
}

class FlashCard {
  String title;
  String content;

  FlashCard({
    required this.title,
    required this.content,
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
