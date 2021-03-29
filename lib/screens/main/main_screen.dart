//import 'package:nua/constants.dart';
//import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:nua/components/bottom_navbar.dart';
import 'package:nua/components/nua_daily.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(115.0),
        child: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          title: SizedBox(
            height: 110.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, //start from top
              crossAxisAlignment: CrossAxisAlignment.start, //start from left
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    'NUA',
                    style: TextStyle(
                      color: Color.fromRGBO(29, 29, 29, 1), 
                      fontSize: 35.0, 
                      fontFamily: 'NicoMoji',
                      letterSpacing: 3.5,
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 20.0),
                  child: Text(
                    'an app for space news',
                    style: TextStyle(
                        color: Color.fromRGBO(58, 65, 66, 1), 
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                        letterSpacing: 1.0,
                      )
                    ),
                  )
              ]
            ),
          ),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          //backgroundColor: Color.fromRGBO(200, 200, 200, 1),
          elevation: 10, //shadow
          toolbarHeight: 200,
        )
      ),
      body: ListView(

        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[

          SizedBox(height: 20.0),
          NUADaily(),

        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

/*class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen >{

  int _index = 0;

  @override 
  Widget build(BuildContext context){

    return Scaffold(

      body: SafeArea( 
        child: Column(
          children: [
            Spacer(flex: 2),
            Image.asset("assets/images/welcome_image.png"),
            Spacer(flex: 3),
            Text(
              "Space News for You",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            )
        ]
        )
      


      ),
      /*extendBody: true,
      bottomNavigationBar: new Theme(

        data:Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: Colors.green,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        backgroundColor: Colors.red,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
        child: new FloatingNavbar(
      
/*         currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value; 
          });
        }, */
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          FloatingNavbarItem(
            icon: Icons.search,
            title: 'Search',
          ),
          FloatingNavbarItem(
            icon: Icons.home,
            title: 'Home',
          )
        ],
      ),*/

    

    );
  }
}*/