import 'dart:convert';
import 'package:http/http.dart';
import 'package:nua/models/hsallnews.model.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
class APIManager {
  final String newsUrl = "https://space-bot-2021.herokuapp.com/v1/news";

  Future<List<HsAllNews>> getNews() async {
    Response res = await get(newsUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      /* log(res.body); */
      List<HsAllNews> news = body
        .map(
          (dynamic item) => HsAllNews.fromJson(item),
        )
        .toList();

      return news;
    } else {
      throw "Unable to retrieve pod.";
    }
  }
}

/* class API_Manager{

  Future<Nasapod> getPod() async {
    var client = http.Client();
    var nasaPod;
    log('Quering Data');

    try {
      Response response = await client.get('https://space-bot-2021.herokuapp.com/v1/pod');
      if (response.statusCode == 200) {
        log('200');
        var jsonString = response.body;
        /* print(jsonString); */
        /* log(jsonString); */
        var jsonMap = json.decode(jsonString);
        log(jsonMap);
        nasaPod = Nasapod.fromJson(jsonMap);
      }else{

        /* log('yo1'); */

      }
    } catch (Exception) {
      log(Exception.toString());
      return nasaPod;
    }

    return nasaPod;
  }

} */