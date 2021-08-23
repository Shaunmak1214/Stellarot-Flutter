import 'package:flutter/material.dart';
import '../apis/SpaceNews.dart';
import '../apis/Suggestions.dart';
import '../widgets/CategoryButtons.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _catSelectedIndex = 0;
  String _catSelected = '';
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
                          _catSelected = "";
                        })
                      },
                      selected: _catSelectedIndex == 0 ? true : false,
                    ),
                    CategoryButtons(
                      buttonText: "Nasa",
                      onPressed: () => {
                        setState(() {
                          _catSelectedIndex = 1;
                          _catSelected = "nasa";
                        })
                      },
                      selected: _catSelectedIndex == 1 ? true : false,
                    ),
                    CategoryButtons(
                      buttonText: "Space X",
                      onPressed: () => {
                        setState(() {
                          _catSelectedIndex = 2;
                          _catSelected = "spacex";
                        })
                      },
                      selected: _catSelectedIndex == 2 ? true : false,
                    ),
                    CategoryButtons(
                      buttonText: "SNAAPI",
                      onPressed: () => {
                        setState(() {
                          _catSelectedIndex = 3;
                          _catSelected = "snapi";
                        })
                      },
                      selected: _catSelectedIndex == 3 ? true : false,
                    ),
                    CategoryButtons(
                      buttonText: "Blue Origin",
                      onPressed: () => {
                        setState(() {
                          _catSelectedIndex = 4;
                          _catSelected = "blueorigin";
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
                    child: SpaceNewsListView(
                      cat: _catSelected,
                    )),
              )
            ],
          ),
        ),
        );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = ['Ankara', 'İzmir', 'İstanbul', 'Samsun', 'Sakarya'];
  var recentCities = ['Ankara'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, '');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Card(
          color: Colors.red,
          child: Center(child: Text(query)),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(query);
    // final suggestionList = query.isEmpty
    //     ? recentCities
    //     : cities.where((p) => p.startsWith(query)).toList();

    // return ListView.builder(
    //   itemBuilder: (context, index) => ListTile(
    //     onTap: () {
    //       showResults(context);
    //     },
    //     leading: Icon(Icons.location_city),
    //     title: RichText(
    //       text: TextSpan(
    //         text: suggestionList[index].substring(0, query.length),
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontWeight: FontWeight.bold,
    //         ),
    //         children: [
    //           TextSpan(
    //             text: suggestionList[index].substring(query.length),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   itemCount: suggestionList.length,
    // );

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SearcherListView(query: query)),
        ));
  }
}
