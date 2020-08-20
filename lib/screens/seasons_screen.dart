import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/season.dart';

class Seasons extends StatelessWidget {
  static const routName = '/seasons_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/images/season_back.jpeg'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.black54],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back,color: Colors.white,),
                        onPressed: ()=>Navigator.of(context).pop(),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 65),
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/nLogo.png'))),)

                    ],
                  ),
                ),

//                Container(
//                  margin: EdgeInsets.only(top: 40),
//                  width: 100,
//                  height: 60,
//                  child: Image.asset(
//                    'assets/images/nLogo.png',
//                  ),
//                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 170,
                  height: 150,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 200,
                  height: 360,
                  child: ListView.builder(
                    itemCount: dummySeasons.length,
                    itemBuilder: (ctx, i) => Season(
                      imageUrl: dummySeasons[i].imageUrl,
                      title: dummySeasons[i].title,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
