import 'package:flutter/material.dart';
import 'package:netflix/screens/seasons_screen.dart';

import '../dummy_data.dart';

class CircleMovie extends StatelessWidget {
  final index;

  CircleMovie(this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Seasons.routName),
      child: Container(
        width: 115,
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color.fromRGBO(171, 10, 10, 1))),
              child: CircleAvatar(
                backgroundImage: AssetImage(dummyCMovies[index].imageUrl),
                radius: 45,
              ),
            ),
//
            SizedBox(
              height: 5,
            ),
            Text(
              dummyCMovies[index].title,

              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'SF-Pro-Display-Regular.otf',color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
