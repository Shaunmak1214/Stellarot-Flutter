import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import './apis/SpaceNews.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import './presentation/menu_icons.dart';
import './widgets/CategoryButtons.dart';

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
          scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
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
  int _selectedIndex = 0;
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
                child: Text(widget.title,
                    style: TextStyle(fontSize: 25, fontFamily: 'Andalemo'))),
            backgroundColor: Colors.white,
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
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Wrap(children: [
                        CategoryButtons(
                          buttonText: "All",
                        ),
                        CategoryButtons(
                          buttonText: "Nasa",
                        ),
                        CategoryButtons(
                          buttonText: "Space X",
                        ),
                        CategoryButtons(
                          buttonText: "SNAAPI",
                        ),
                        CategoryButtons(
                          buttonText: "Blue Origin",
                        ),
                      ]),
                    ),
                    Padding(padding: const EdgeInsets.all(10.0)),
                    Center(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: SpaceNewsListView())),
                  ])
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
                            top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
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
                              icon: LineIcons.heart,
                              text: 'Likes',
                            ),
                            GButton(
                              icon: LineIcons.search,
                              text: 'Search',
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
