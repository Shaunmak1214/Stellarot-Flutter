import 'package:nua/constants.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';


class MainScreen extends StatefulWidget {

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
      extendBody: true,
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
      ),

      ),

    );

  }

}