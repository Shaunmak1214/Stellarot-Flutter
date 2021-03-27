import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nua/models/nasapod.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class API_Manager{

  Future<Nasapod> getPod() async {
    var client = http.Client();
    var nasaPod;
    log('Quering Data');

    try {
      var response = await client.get('https://space-bot-2021.herokuapp.com/v1/pod');
      if (response.statusCode == 200) {
        log('200');
        var jsonString = response.body;
        /* print(jsonString); */
        log(jsonString);
        var jsonMap = json.decode(jsonString);
        /* log(jsonMap); */

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

}