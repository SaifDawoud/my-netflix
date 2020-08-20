
import 'package:flutter/material.dart';
import 'package:netflix/models/new_movie.dart';
import 'package:provider/provider.dart';
import '../providers/tmdb.dart';

class RectMovie extends StatelessWidget {
  final index;

  RectMovie(this.index);

  @override
  Widget build(BuildContext context) {
   final List<NewMovieModel> dummyMovies=Provider.of<MoviesContainer>(context).movies;
    return Container(
      width: 115,
      height: 90,
      padding: const EdgeInsets.all(5.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            height: 110,
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                    image: NetworkImage('https://image.tmdb.org/t/p/w220_and_h330_face${dummyMovies[index].imageUrl}'))),
          ),

        SizedBox(height: 10,),
          FittedBox(
            child: Text(
              dummyMovies[index].title,

              style: TextStyle(fontFamily: 'SF-Pro-Display-Bold.otf',color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),
            ),
          ),
          FittedBox(child: Text(dummyMovies[index].date, style: TextStyle(fontFamily: 'SF-Pro-Display-Regular.otf',color: Colors.white,fontSize: 10))),
        ],
      ),
    );
  }
}
