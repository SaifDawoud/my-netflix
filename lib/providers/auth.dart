import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/home_screen.dart';
import '../models/authException.dart';
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _exDate;
  String _userId;

  Future<void> signUp(String email, String password, BuildContext ctx) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyD2Rh9rNMva7btV0LnCvFAmXF2dFEdS930 ';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      if (!response.body.contains('error')) {
        Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
     final responseData=json.decode(response.body);
      if(responseData['error'] !=null){
        throw AuthException(responseData['error']['message']);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> login(String email, String password, BuildContext ctx) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyD2Rh9rNMva7btV0LnCvFAmXF2dFEdS930';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      if (!response.body.contains('error')) {
        Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
      final responseData=json.decode(response.body);
      if(responseData['error']!=null){

        throw AuthException(responseData['error']['message']);
      }

    } catch (e) {
      throw e;
    }
  }
}
