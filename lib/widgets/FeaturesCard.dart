import 'package:flutter/material.dart';

class FeaturesCard extends StatefulWidget {
  FeaturesCard(
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
  _FeaturesCardState createState() => _FeaturesCardState();
}

class _FeaturesCardState extends State<FeaturesCard> {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color.fromRGBO(245, 245, 245, 1.0),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 425.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.imageUrl)),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Color.fromRGBO(245, 245, 245, 1.0),
                ),
              ),
              Container(
                height: 425.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.black,
                        ],
                        stops: [
                          0.0,
                          1.0
                        ])),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Container(
                  width: c_width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          maxLines: null,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold)),
                      Padding(padding: const EdgeInsets.only(top: 10.0)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.link_outlined,
                                    size: 15.0,
                                    semanticLabel: 'Link',
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10.0)),
                                  Text(widget.newsSite,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0)),
                                ]),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.timelapse_outlined,
                                    size: 15.0,
                                    semanticLabel: 'Link',
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10.0)),
                                  Text("1h",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0)),
                                ])
                          ])
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
