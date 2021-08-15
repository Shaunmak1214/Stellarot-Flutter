import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../widgets/NewsCard.dart';
import '../widgets/FeaturesCard.dart';

class SpaceNews {
  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final String publishedAt;

  SpaceNews(
      {this.id = 1,
      this.title = "",
      this.url = "",
      this.imageUrl = "",
      this.newsSite = "",
      this.summary = "",
      this.publishedAt = ""});

  factory SpaceNews.fromJson(Map<String, dynamic> json) {
    return SpaceNews(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      newsSite: json['newsSite'],
      summary: json['summary'],
      publishedAt: json['publishedAt'],
    );
  }
}

class SpaceNewsListView extends StatefulWidget {
  SpaceNewsListView({Key? key}) : super(key: key);

  _SpaceNewsListView createState() => _SpaceNewsListView();
}

class _SpaceNewsListView extends State<SpaceNewsListView> {
  ScrollController _scrollController = ScrollController();
  int count = 10;
  bool _loading = false;

  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        count = count + 20;
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Column newsCard(int index, String title, String url, String imageUrl,
      String newsSite, String summary) {
    if (index == 0) {
      return Column(
        children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            Text('Dashboard',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            Text(' - Daily news',
                style: TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'))
          ]),
          Padding(padding: const EdgeInsets.only(top: 20.0)),
          FeaturesCard(
              index: index,
              title: title,
              url: url,
              imageUrl: imageUrl,
              newsSite: newsSite,
              summary: summary),
        ],
      );
    } else {
      return Column(
        children: [
          NewsCard(
              index: index,
              title: title,
              url: url,
              imageUrl: imageUrl,
              newsSite: newsSite,
              summary: summary),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceNews>>(
      future: _fetchNews(count),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SpaceNews>? data = snapshot.data;
          return Column(
            children: [
              Expanded(
                child: _newsListView(data),
              ),
              _loading
                  ? Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Lottie.network(
                                  'https://assets3.lottiefiles.com/packages/lf20_ObshHL.json'),
                            ),
                          ]))
                  : SizedBox(
                      width: 0,
                      height: 0,
                    )
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: 100.0,
            height: 100.0,
            child: Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_ObshHL.json'),
          ),
        ]);
      },
    );
  }

  Future<List<SpaceNews>> _fetchNews(int count) async {
    setState(() {
      _loading = true;
    });
    var url = new Uri.https('api.spaceflightnewsapi.net', '/v3/articles',
        {"_limit": count.toString()});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _loading = false;

      return jsonResponse.map((news) => new SpaceNews.fromJson(news)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _newsListView(data) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return newsCard(index, data[index].title, data[index].url,
              data[index].imageUrl, data[index].newsSite, data[index].summary);
        });
  }
}
