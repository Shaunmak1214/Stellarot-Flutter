import 'package:flutter/foundation.dart';

class HsAllNews {

  final String news_id;
  final String name;
  final String url;
  final String publication;
  final String abstract;
  final String thumbnail;

  HsAllNews({
    @required this.news_id,
    @required this.name,
    @required this.url,
    @required this.publication,
    @required this.abstract,
    @required this.thumbnail,
  });

  factory HsAllNews.fromJson(Map<String, dynamic> json) {
    return HsAllNews(
      news_id: json['news_id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      publication: json['publication'] as String,
      abstract: json['abstract'] as String,
      thumbnail: json['thumbnail'] as String
    );
  }

}