// To parse this JSON data, do
//
//     final lectureInfo = lectureInfoFromJson(jsonString);

import 'dart:convert';

LectureInfo lectureInfoFromJson(String str) =>
    LectureInfo.fromJson(json.decode(str));

String lectureInfoToJson(LectureInfo data) => json.encode(data.toJson());

class LectureInfo {
  final Data? data;
  final int? code;
  final String? message;

  LectureInfo({
    this.data,
    this.code,
    this.message,
  });

  factory LectureInfo.fromJson(Map<String, dynamic> json) => LectureInfo(
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
  final String? lectureId;
  final String? title;
  final DateTime? lectureDate;
  final int? durationMins;
  final String? topics;
  final String? summary;
  final List<AiScore>? aiScore;
  final String? s3Url;
  final String? s3FileName;
  final String? s3VideoPath;
  final String? uploadStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? deviceId;
  final List<FlashCard>? flashCards;
  final List<SupplementaryResource>? supplementaryResources;
  final int? lectureNumber;
  final String? presignedDownloadUrl;
  final String? videoDownloadUrl;
  final String? transcript;

  Data({
    this.lectureId,
    this.title,
    this.lectureDate,
    this.durationMins,
    this.topics,
    this.summary,
    this.aiScore,
    this.s3Url,
    this.s3FileName,
    this.s3VideoPath,
    this.uploadStatus,
    this.createdAt,
    this.updatedAt,
    this.deviceId,
    this.flashCards,
    this.supplementaryResources,
    this.lectureNumber,
    this.presignedDownloadUrl,
    this.videoDownloadUrl,
    this.transcript,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lectureId: json["lecture_id"],
        title: json["title"],
        lectureDate: json["lecture_date"] == null
            ? null
            : DateTime.parse(json["lecture_date"]),
        durationMins: json["duration_mins"],
        topics: json["topics"],
        summary: json["summary"],
        aiScore: json["ai_score"] == null
            ? []
            : List<AiScore>.from(
                json["ai_score"]!.map((x) => AiScore.fromJson(x))),
        s3Url: json["s3_url"],
        s3FileName: json["s3_file_name"],
        s3VideoPath: json["s3_video_path"],
        uploadStatus: json["upload_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deviceId: json["device_id"],
        flashCards: json["flash_cards"] == null
            ? []
            : List<FlashCard>.from(
                json["flash_cards"]!.map((x) => FlashCard.fromJson(x))),
        supplementaryResources: json["supplementary_resources"] == null
            ? []
            : List<SupplementaryResource>.from(json["supplementary_resources"]!
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
            "${lectureDate!.year.toString().padLeft(4, '0')}-${lectureDate!.month.toString().padLeft(2, '0')}-${lectureDate!.day.toString().padLeft(2, '0')}",
        "duration_mins": durationMins,
        "topics": topics,
        "summary": summary,
        "ai_score": aiScore == null
            ? []
            : List<dynamic>.from(aiScore!.map((x) => x.toJson())),
        "s3_url": s3Url,
        "s3_file_name": s3FileName,
        "s3_video_path": s3VideoPath,
        "upload_status": uploadStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "device_id": deviceId,
        "flash_cards": flashCards == null
            ? []
            : List<dynamic>.from(flashCards!.map((x) => x.toJson())),
        "supplementary_resources": supplementaryResources == null
            ? []
            : List<dynamic>.from(
                supplementaryResources!.map((x) => x.toJson())),
        "lecture_number": lectureNumber,
        "presigned_download_url": presignedDownloadUrl,
        "video_download_url": videoDownloadUrl,
        "transcript": transcript,
      };
}

class AiScore {
  final String? parameter;
  final int? score;
  final String? reason;

  AiScore({
    this.parameter,
    this.score,
    this.reason,
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

class SupplementaryResource {
  final String? resource;
  final String? link;

  SupplementaryResource({
    this.resource,
    this.link,
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
