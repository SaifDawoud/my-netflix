import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Container(
            padding: EdgeInsets.all(0),
            height: 140,
            color: Colors.black12,
          ),
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 140,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Preview.png'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
          top: 45,
          left: 10,
        ),
        Positioned(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
          top: 45,
          right: 10,
        ),
        Positioned(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_circle_filled,
              color: Colors.white,
              size: 40,
            ),
          ),
          bottom: 10,
          right: 30,
        ),
        Positioned(
          child: Text(
            'MISSION IMPOSSIBLE:FALLOUT',
            style: TextStyle(fontFamily: 'SF-Pro-Display-Regular.otf',color: Colors.white, fontSize: 14),
          ),
          left: 30,
          bottom: 15,
        ),

      ],
    );
  }
}
