import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:ui' as ui;

class Post extends StatefulWidget {
  Post(
      {Key? key,
      required this.title,
      required this.url,
      required this.imageUrl,
      required this.newsSite,
      required this.summary})
      : super(key: key);

  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double cwidth = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: new Drawer(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              // Important: Remove any padding from the ListView.

              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          leadingWidth: 65,
        ),
        body: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  color: Color.fromRGBO(245, 245, 245, 1.0),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 600.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(widget.imageUrl)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                              color: Color.fromRGBO(245, 245, 245, 1.0),
                            ),
                          ),
                          Container(
                            height: 600.0,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
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
                              width: cwidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(widget.title,
                                      maxLines: null,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      widget.summary,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: ClipRRect(
              child: new BackdropFilter(
                  filter: new ui.ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                        child: GNav(
                          backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
                          rippleColor: Colors.grey[300]!,
                          hoverColor: Colors.grey[100]!,
                          gap: 8,
                          activeColor: Colors.black,
                          iconSize: 24,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          duration: Duration(milliseconds: 400),
                          tabBackgroundColor: Colors.white,
                          color: Colors.white,
                          tabs: [
                            GButton(
                              icon: LineIcons.home,
                              text: 'Home',
                            ),
                            GButton(
                              icon: LineIcons.search,
                              text: 'Search',
                            ),
                            GButton(
                              icon: LineIcons.inbox,
                              text: 'Inbox',
                            ),
                            GButton(
                              icon: LineIcons.user,
                              text: 'Profile',
                            ),
                          ],
                          selectedIndex: _selectedIndex,
                          onTabChange: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ))),
        ));
  }
}
