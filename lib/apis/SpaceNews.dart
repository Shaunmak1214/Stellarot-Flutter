import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

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

class SpaceNewsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceNews>>(
      future: _fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SpaceNews>? data = snapshot.data;
          return _newsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Lottie.network(
            'https://assets5.lottiefiles.com/packages/lf20_x62chJ.json');
      },
    );
  }

  Future<List<SpaceNews>> _fetchNews() async {
    var url = new Uri.https('api.spaceflightnewsapi.net', '/v3/articles');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(response.body);
      return jsonResponse.map((news) => new SpaceNews.fromJson(news)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _newsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return newsCard(index, data[index].title, data[index].url,
              data[index].imageUrl, data[index].newsSite, data[index].summary);
        });
  }

  Container newsCard(int index, String title, String url, String imageUrl,
      String newsSite, String summary) {
    if (index == 0) {
      return Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(245, 245, 245, 1.0),
          ),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'Starliner resets for next launch attempt after ISS problems',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold)),
                    Padding(padding: const EdgeInsets.only(top: 20.0)),
                    Container(
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://spacenews.com/wp-content/uploads/2018/02/DVRo82zXcAAqA-E.jpg')),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Color.fromRGBO(245, 245, 245, 1.0),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 20.0)),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.link_outlined,
                                  size: 15.0,
                                  semanticLabel: 'Link',
                                ),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text("Nasa", style: TextStyle(fontSize: 15.0)),
                              ]),
                          Padding(padding: EdgeInsets.only(left: 10.0)),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.timelapse_outlined,
                                  size: 15.0,
                                  semanticLabel: 'Link',
                                ),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text("1h", style: TextStyle(fontSize: 15.0)),
                              ])
                        ])
                  ])));
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: 150.0,
                      height: 110.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(imageUrl)),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Color.fromRGBO(245, 245, 245, 1.0),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(title,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 45.0,
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            Icons.link_outlined,
                                            size: 10.0,
                                            semanticLabel: 'Link',
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 5.0)),
                                          Text(
                                            newsSite,
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                        ]),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.0)),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            Icons.timelapse_outlined,
                                            size: 10.0,
                                            semanticLabel: 'Link',
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 5.0)),
                                          Text("1h",
                                              style: TextStyle(fontSize: 10.0)),
                                        ])
                                  ])
                            ])),
                  )
                ])),
      );
    }
  }
}
