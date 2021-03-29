import 'package:flutter/material.dart';
import 'package:nua/models/hsallnews.model.dart';
import 'package:nua/models/nasapod.dart';
import 'package:nua/services/api_manager.dart';

class NUADaily extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {

    return Column(

      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'NUA Daily',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Theme.of(context).primaryColor,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          child: FutureBuilder(
            future: APIManager().getNews(),
            builder: (BuildContext context, AsyncSnapshot<List<HsAllNews>> snapshot) {
              if(snapshot.hasData){
                List<HsAllNews> pod = snapshot.data;
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: pod
                    .map(
                      (HsAllNews pod) => ListTile(
                        title: Text(pod.name),
                        subtitle: Text("${pod.publication}"),
                      ),
                    ).toList(),
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

        ),
      ],

    );

  }
  
}

/* class NUADaily extends StatefulWidget {

  /* NUADaily({Key key}) : super(key: key); */

  @override
  _NUADailyState createState() => _NUADailyState();

}

class _NUADailyState extends State<NUADaily> {

  Future<Nasapod> _nasaPod;

  @override
  void initState(){

    _nasaPod = API_Manager().getPod();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'NUA Daily',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Theme.of(context).primaryColor,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          child: FutureBuilder<Nasapod>(
            future: _nasaPod,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Container(
                      height: 100,
                      color: Colors.red,
                    );
                  });
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

        ),
      ],

    );
  }
} */