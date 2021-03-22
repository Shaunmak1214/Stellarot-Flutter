import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget{

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
}