import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stellarot/screens/Inbox.dart';
import '../presentation/menu_icons.dart';
import 'Dashboard.dart';
import 'dart:ui' as ui;

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Center(
              child: Text('Stellarot',
                  style: TextStyle(fontSize: 25, fontFamily: 'Andalemo'))),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: new Icon(Menu.group_21, size: 14),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          leadingWidth: 56,
          actions: [
            Container(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: DataSearch(),
                    );
                  }),
            )
          ]),
      body: SafeArea(
        child: IndexedStack(index: _selectedIndex, children: <Widget>[
      Dashboard(),
      Container(child: null),
      Inbox(),
Container(child: null),
    ])),
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
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                        child: GNav(
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
                          rippleColor: Colors.grey[300]!,
                          hoverColor: Colors.grey[100]!,
                          gap: 8,
                          activeColor: Colors.white,
                          iconSize: 24,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          duration: Duration(milliseconds: 400),
                          tabBackgroundColor: Colors.black,
                          color: Colors.black,
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
        )
    );
  }
}