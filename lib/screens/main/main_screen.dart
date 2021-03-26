import 'package:nua/constants.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen >{

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
      bottomNavigationBar: BottomNavigationBar(
/*         currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value; 
          });
        }, */
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),

    );

  }

}