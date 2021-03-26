import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60,
      margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromRGBO(225, 225, 225, 0.5), //grey background
        //color: Color.fromRGBO(255, 255, 255, 0.5), //white background
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, size: 30),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          IconButton(
            icon: Icon(Icons.search, size: 30),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/search');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, size: 30),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/notification');
            },
          ),
          IconButton(
            icon: Icon(Icons.supervised_user_circle, size: 30),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
          )
        ]
      ),
    );
  }
}
/*class BottomNavBar extends StatelessWidget{

  @override 
  Widget build(BuildContext context){

    return Container(
      child: Row(
        children: <Widget>[
          IconButton{ //?????
            icon: Icon(Icons.camera),
          }

          bottomNavigationBar:BottomNavigationBar(

            items: const<BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
          ),

        ],
      ),
    );
  }
}*/