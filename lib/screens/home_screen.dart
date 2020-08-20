import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';
import '../widgets/rect_movie.dart';
import '../widgets/circle_movie.dart';
import '../widgets/video.dart';
import '../providers/tmdb.dart';
import '../widgets/mynav.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController myController = PageController();
//@override
//  void didChangeDependencies() {
//  Provider.of<MoviesContainer>(context).getMovies();
//    super.didChangeDependencies();
//  }
  @override
  Widget build(BuildContext context) {
//    final movies=Provider.of<MoviesContainer>(context).movies;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage('assets/images/background.jpeg'),
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
          child: ListView(children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              width: 100,
              height: 50,
              child: Image.asset(
                'assets/images/nLogo.png',
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 30, bottom: 5),
                child: Text(
                  'PREVIEW',
                  style: TextStyle(
                      fontFamily: 'SF-Pro-Display-Bold.otf',
                      fontSize: 20,
                      color: Colors.white),
                )),
            Container(
              height: 150,
              child: PageView(
                controller: myController,
                children: List.generate(4, (_) => Preview()),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 8,
              child: SmoothPageIndicator(
                controller: myController,
                count: 4,
                effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: Colors.red,
                    activeDotColor: Colors.red,
                    expansionFactor: 3),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Text(
                'NEW TO CINEMA',
                style: TextStyle(
                    fontFamily: 'SF-Pro-Display-Regular.otf',
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: 300,
              height: 160,
              child: FutureBuilder(
                future: Provider.of<MoviesContainer>(context,listen: false).getMovies() ,
                builder:(context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){return CircularProgressIndicator();}
                  return snapshot.connectionState==ConnectionState.done?
                    Consumer<MoviesContainer>(
                     builder:(context,snapshot,child){return ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: snapshot.movies.length,
                       itemBuilder: (ctx, i) => RectMovie(i),
                     );}
                   ):Center(child: Text('Something went wrong'),) ;



                }
              ),
            ),
            Center(
                child: Text(
              'TV-SHOWS',
              style: TextStyle(
                  fontFamily: 'SF-Pro-Display-Bold.otf',
                  color: Color.fromRGBO(171, 10, 10, 1),
                  fontSize: 20),
            )),
            Container(
              padding: EdgeInsets.all(10),
              width: 100,
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyMovies.length,
                itemBuilder: (ctx, i) => CircleMovie(i),
              ),
            )
          ]),
        ),
        bottomNavigationBar: MyNav(),
      ),
    );
  }
}
