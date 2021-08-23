import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stellarot/apis/Followed.dart';

class Inbox extends StatefulWidget {
  Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<String> subsribed = [];
  @override
  void initState() {
    super.initState();
    _getSubscribed();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SearcherListView(subscribed: subsribed)),
        ));
  }

  _getSubscribed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> allEntries = prefs.getKeys();
    List<String> allEntriesList = allEntries.toList();
    List<String> subscribed = allEntriesList
        .where((newsSite) => prefs.getBool(newsSite) == true)
        .toList();

    setState(() {
      subsribed = subscribed;
    });
  }
}
