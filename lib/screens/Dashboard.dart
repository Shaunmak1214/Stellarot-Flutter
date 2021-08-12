import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:ui' as ui;
import '../apis/SpaceNews.dart';
import '../presentation/menu_icons.dart';
import '../widgets/CategoryButtons.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  int _catSelectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    int _selectedCatIndex = 0;
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
                  child: Icon(Icons.search))
            ]),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: Container(
                  width: double.infinity,
                  height: 35.0,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    CategoryButtons(
                      buttonText: "All",
                      onPressed: () => {
                        setState(() {
                          _catSelectedIndex = 0;
                        })
                      },
                      selected: _catSelectedIndex == 0 ? true : false,
                    ),
                    CategoryButtons(
                      buttonText: "Nasa",
                      onPressed: () => {
                        setState(() {
                          _catSelectedIndex = 1;
                        })
                      },
                      selected: _catSelectedIndex == 1 ? true : false,
                    ),
                    CategoryButtons(
                      buttonText: "Space X",
                      onPressed: () => {
                        setState(() {
                          _catSelectedIndex = 2;
                        })
                      },
                      selected: _catSelectedIndex == 2 ? true : false,
                    ),
                    CategoryButtons(
                      buttonText: "SNAAPI",
                      onPressed: () => {
                        setState(() {
                          _catSelectedIndex = 3;
                        })
                      },
                      selected: _catSelectedIndex == 3 ? true : false,
                    ),
                    CategoryButtons(
                      buttonText: "Blue Origin",
                      onPressed: () => {
                        setState(() {
                          _catSelectedIndex = 4;
                        })
                      },
                      selected: _catSelectedIndex == 4 ? true : false,
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height - 225,
                    child: SpaceNewsListView()),
              )
            ],
          ),
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
                                onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dashboard()),
                                      ),
                                    }),
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
