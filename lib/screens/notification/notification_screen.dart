import 'package:flutter/material.dart';
import 'package:nua/components/bottom_navbar.dart';


class NotificationScreen extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Screen'),
      ),
      body: Center(child: Text('You have pressed the button.')),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}