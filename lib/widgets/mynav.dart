import 'package:flutter/material.dart';

class MyNav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Color.fromRGBO(171, 10, 10, 1),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            title: FittedBox(child: Text('HOME'))),
        BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: FittedBox(child: Text('DOWNLOADS'))),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: FittedBox(child: Text('SEARCH'))),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu), title: FittedBox(child: Text('MENU'))),
      ],
    );
  }
}