import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stellarot',
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black,
          scaffoldBackgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
          fontFamily: 'Montserrat'),
      home: MyHomePage(title: 'Stellarot'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Dashboard',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold)),
                  Text(' - Daily news',
                      style:
                          TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'))
                ]),
            Padding(padding: const EdgeInsets.only(top: 20.0)),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'Starliner resets for next launch attempt after ISS problems',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold)),
                          Padding(padding: const EdgeInsets.only(top: 20.0)),
                          Container(
                            width: double.infinity,
                            height: 175.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://spacenews.com/wp-content/uploads/2018/02/DVRo82zXcAAqA-E.jpg')),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              color: Color.fromRGBO(245, 245, 245, 1.0),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 10.0)),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.link_outlined,
                                        size: 20.0,
                                        semanticLabel: 'Link',
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10.0)),
                                      Text("Nasa"),
                                    ]),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.timelapse_outlined,
                                        size: 20.0,
                                        semanticLabel: 'Link',
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10.0)),
                                      Text("1h"),
                                    ])
                              ])
                        ]))),
            Padding(padding: const EdgeInsets.only(top: 30.0)),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                ),
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: 150.0,
                              height: 125.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://spacenews.com/wp-content/uploads/2021/08/russian-movie-crew.jpg')),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromRGBO(245, 245, 245, 1.0),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                          'New details of Russian “movie in space” seeks funding',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 45.0,
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.link_outlined,
                                                    size: 20.0,
                                                    semanticLabel: 'Link',
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0)),
                                                  Text("Nasa"),
                                                ]),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.0)),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.timelapse_outlined,
                                                    size: 20.0,
                                                    semanticLabel: 'Link',
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0)),
                                                  Text("1h"),
                                                ])
                                          ])
                                    ])),
                          )
                          // Image(
                          //     image: NetworkImage(
                          //         'https://spacenews.com/wp-content/uploads/2018/02/DVRo82zXcAAqA-E.jpg'),
                          //     width: 150.0),
                          // Container(
                          //   width: 150.0,
                          //   height: 150.0,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         fit: BoxFit.cover,
                          //         image: NetworkImage(
                          //             'https://spacenews.com/wp-content/uploads/2018/02/DVRo82zXcAAqA-E.jpg')),
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(8.0)),
                          //     color: Color.fromRGBO(245, 245, 245, 1.0),
                          //   ),
                          // ),
                          // Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: <Widget>[
                          //       Text(
                          //           'Senate confirms NASA CFO qweqweqweqew')
                          //     ])
                        ])),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                ),
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: 150.0,
                              height: 125.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://spacenews.com/wp-content/uploads/2021/08/russian-movie-crew.jpg')),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromRGBO(245, 245, 245, 1.0),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                          'New details of Russian “movie in space” seeks funding',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 45.0,
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.link_outlined,
                                                    size: 20.0,
                                                    semanticLabel: 'Link',
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0)),
                                                  Text("Nasa"),
                                                ]),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.0)),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.timelapse_outlined,
                                                    size: 20.0,
                                                    semanticLabel: 'Link',
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0)),
                                                  Text("1h"),
                                                ])
                                          ])
                                    ])),
                          )
                        ])),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                ),
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: 150.0,
                              height: 125.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://spacenews.com/wp-content/uploads/2021/08/russian-movie-crew.jpg')),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromRGBO(245, 245, 245, 1.0),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                          'New details of Russian “movie in space” seeks funding',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 45.0,
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.link_outlined,
                                                    size: 20.0,
                                                    semanticLabel: 'Link',
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0)),
                                                  Text("Nasa"),
                                                ]),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.0)),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.timelapse_outlined,
                                                    size: 20.0,
                                                    semanticLabel: 'Link',
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0)),
                                                  Text("1h"),
                                                ])
                                          ])
                                    ])),
                          )
                        ])),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
