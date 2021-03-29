// To parse this JSON data, do
//
//     final nasapod = nasapodFromJson(jsonString);

/* import 'dart:convert';

Nasapod nasapodFromJson(String str) => Nasapod.fromJson(json.decode(str));

String nasapodToJson(Nasapod data) => json.encode(data.toJson());

class Nasapod {
    Nasapod({
        this.copyright,
        this.date,
        this.explanation,
        this.hdurl,
        this.mediaType,
        this.serviceVersion,
        this.title,
        this.url,
    });

    String copyright;
    DateTime date;
    String explanation;
    String hdurl;
    String mediaType;
    String serviceVersion;
    String title;
    String url;

    factory Nasapod.fromJson(Map<String, dynamic> json) => Nasapod(
        copyright: json["copyright"],
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
    };
}
 */

import 'package:flutter/foundation.dart';

class Nasapod {

  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  Nasapod({
    @required this.copyright,
    @required this.date,
    @required this.explanation,
    @required this.hdurl,
    @required this.mediaType,
    @required this.serviceVersion,
    @required this.title,
    @required this.url,
  });

  factory Nasapod.fromJson(Map<String, dynamic> json) {
    return Nasapod(
      copyright: json['copyright'] as String,
      date: json['date'] as String,
      explanation: json['explanation'] as String,
      hdurl: json['hdurl'] as String,
      mediaType: json['mediaType'] as String,
      serviceVersion: json['serviceVersion'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }
}