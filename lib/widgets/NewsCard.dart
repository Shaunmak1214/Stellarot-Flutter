import 'package:flutter/material.dart';
import '../screens/Post.dart';

class NewsCard extends StatefulWidget {
  NewsCard(
      {Key? key,
      required this.index,
      required this.title,
      required this.url,
      required this.imageUrl,
      required this.newsSite,
      required this.summary})
      : super(key: key);

  final int index;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Post(
                      title: widget.title,
                      url: widget.url,
                      imageUrl: widget.imageUrl,
                      newsSite: widget.newsSite,
                      summary: widget.summary)),
            );
          },
          child: Container(
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
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.imageUrl)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(245, 245, 245, 1.0),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(widget.title,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 45.0,
                                  ),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                  padding: EdgeInsets.only(
                                                      left: 5.0)),
                                              Text(
                                                widget.newsSite,
                                                style:
                                                    TextStyle(fontSize: 10.0),
                                              ),
                                            ]),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0)),
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
                                                  padding: EdgeInsets.only(
                                                      left: 5.0)),
                                              Text("1h",
                                                  style: TextStyle(
                                                      fontSize: 10.0)),
                                            ])
                                      ])
                                ])),
                      )
                    ])),
          ),
        ),
      ],
    );
  }
}
