// To parse this JSON data, do
//
//     final lectureDetail = lectureDetailFromJson(jsonString);

import 'dart:convert';

LectureDetail lectureDetailFromJson(String str) =>
    LectureDetail.fromJson(json.decode(str));

String lectureDetailToJson(LectureDetail data) => json.encode(data.toJson());

class LectureDetail {
  Data data;
  int code;
  String message;

  LectureDetail({
    required this.data,
    required this.code,
    required this.message,
  });

  factory LectureDetail.fromJson(Map<String, dynamic> json) => LectureDetail(
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
  String lectureId;
  String title;
  DateTime lectureDate;
  int durationMins;
  String topics;
  String summary;
  List<AiScore> aiScore;
  String s3Url;
  String s3FileName;
  String s3VideoPath;
  String uploadStatus;
  DateTime createdAt;
  DateTime updatedAt;
  String deviceId;
  List<FlashCard> flashCards;
  List<SupplementaryResource> supplementaryResources;
  int lectureNumber;
  String presignedDownloadUrl;
  String videoDownloadUrl;
  String transcript;

  Data({
    required this.lectureId,
    required this.title,
    required this.lectureDate,
    required this.durationMins,
    required this.topics,
    required this.summary,
    required this.aiScore,
    required this.s3Url,
    required this.s3FileName,
    required this.s3VideoPath,
    required this.uploadStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.deviceId,
    required this.flashCards,
    required this.supplementaryResources,
    required this.lectureNumber,
    required this.presignedDownloadUrl,
    required this.videoDownloadUrl,
    required this.transcript,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lectureId: json["lecture_id"],
        title: json["title"],
        lectureDate: DateTime.parse(json["lecture_date"]),
        durationMins: json["duration_mins"],
        topics: json["topics"],
        summary: json["summary"],
        aiScore: List<AiScore>.from(
            json["ai_score"].map((x) => AiScore.fromJson(x))),
        s3Url: json["s3_url"],
        s3FileName: json["s3_file_name"],
        s3VideoPath: json["s3_video_path"],
        uploadStatus: json["upload_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deviceId: json["device_id"],
        flashCards: List<FlashCard>.from(
            json["flash_cards"].map((x) => FlashCard.fromJson(x))),
        supplementaryResources: List<SupplementaryResource>.from(
            json["supplementary_resources"]
                .map((x) => SupplementaryResource.fromJson(x))),
        lectureNumber: json["lecture_number"],
        presignedDownloadUrl: json["presigned_download_url"],
        videoDownloadUrl: json["video_download_url"],
        transcript: json["transcript"],
      );

  Map<String, dynamic> toJson() => {
        "lecture_id": lectureId,
        "title": title,
        "lecture_date":
            "${lectureDate.year.toString().padLeft(4, '0')}-${lectureDate.month.toString().padLeft(2, '0')}-${lectureDate.day.toString().padLeft(2, '0')}",
        "duration_mins": durationMins,
        "topics": topics,
        "summary": summary,
        "ai_score": List<dynamic>.from(aiScore.map((x) => x.toJson())),
        "s3_url": s3Url,
        "s3_file_name": s3FileName,
        "s3_video_path": s3VideoPath,
        "upload_status": uploadStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "device_id": deviceId,
        "flash_cards": List<dynamic>.from(flashCards.map((x) => x.toJson())),
        "supplementary_resources":
            List<dynamic>.from(supplementaryResources.map((x) => x.toJson())),
        "lecture_number": lectureNumber,
        "presigned_download_url": presignedDownloadUrl,
        "video_download_url": videoDownloadUrl,
        "transcript": transcript,
      };
}

class AiScore {
  String parameter;
  int score;
  String reason;

  AiScore({
    required this.parameter,
    required this.score,
    required this.reason,
  });

  factory AiScore.fromJson(Map<String, dynamic> json) => AiScore(
        parameter: json["parameter"],
        score: json["score"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "parameter": parameter,
        "score": score,
        "reason": reason,
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

class SupplementaryResource {
  String resource;
  String link;

  SupplementaryResource({
    required this.resource,
    required this.link,
  });

  factory SupplementaryResource.fromJson(Map<String, dynamic> json) =>
      SupplementaryResource(
        resource: json["resource"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "resource": resource,
        "link": link,
      };
}
