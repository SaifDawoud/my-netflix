import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/logIn_screen.dart';
import './providers/auth.dart';
import './screens/seasons_screen.dart';
import './screens/signup.dart';
import './providers/tmdb.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Auth()),
          ChangeNotifierProvider(
            create: (ctx) => MoviesContainer(),
          )
        ],
        child: MaterialApp(
          title: 'Netflix',
          theme: ThemeData(
            fontFamily: 'SF-Pro-Display',
            cursorColor: Color.fromRGBO(171, 10, 10, 1),
            primarySwatch: Colors.red,
          ),
          initialRoute: '/',
          routes: {
            '/': (ctx) => LogIn(),
            Seasons.routName: (ctx) => Seasons(),
            SignUp.routName: (ctx) => SignUp()
          },
        ));
  }
}
