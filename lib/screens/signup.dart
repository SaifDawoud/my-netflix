import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../models/authException.dart';

class SignUp extends StatefulWidget {
  static const routName = '/signUP';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  bool isValid = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Map<String, String> _authData = {'email': '', 'password': ''};

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/images/background.jpeg'),
              fit: BoxFit.fitHeight)),
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
                margin: const EdgeInsets.only(
                    left: 80, right: 80, bottom: 60, top: 100),
                child: Image.asset('assets/images/Netflix.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                              margin: const EdgeInsets.only(left: 50),
                              child: Text(
                                'EMAIL',
                                style: TextStyle(
                                    fontFamily: 'SF-Pro-Display-Regular.otf',
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 51,
                              margin:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  _authData['email'] = val;
                                },
                                controller: emailController,
                                textAlign: TextAlign.center,
                                validator: (String val) {
                                  return val.isEmpty
                                      ? 'Required Field'
                                      : !val.contains('@')
                                          ? 'Invaild Email'
                                          : null;
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(171, 10, 10, 1),
                                            width: 2))),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 50),
                              child: Text(
                                'PASSWORD',
                                style: TextStyle(
                                    fontFamily: 'SF-Pro-Display-Bold.otf',
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 51,
                              margin:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                obscureText: true,
                                onChanged: (val) {
                                  _authData['password'] = val;
                                },
                                validator: (val) {
                                  if (val == null) {
                                    return 'Required Field';
                                  }
                                  if (val.length < 6) {
                                    return 'Short Password';
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    focusColor: Color.fromRGBO(171, 10, 10, 1),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(171, 10, 10, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 50),
                              child: Text(
                                'CONFIRM PASSWORD',
                                style: TextStyle(
                                    fontFamily: 'SF-Pro-Display-Bold.otf',
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 51,
                              margin:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                obscureText: true,
                                validator: (val) {
                                  if (val == null) {
                                    return 'Required Field';
                                  }
                                  if (val != _authData['password'].trim()) {
                                    return 'ENTER THE SAME PASSWORD';
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    focusColor: Color.fromRGBO(171, 10, 10, 1),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(171, 10, 10, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                              ),
                            ),
                          ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 125),
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await auth.signUp(_authData['email'].trim(),
                            _authData['password'].trim(), context);
                      } on AuthException catch (err) {

                        String errMessage = 'COULD NOT Authenticate you';
                        if (err.toString().contains('EMAIL_EXISTS')) {
                          errMessage = 'THIS Email Alrady IN USE';

                         return  showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(elevation: 5,
                                  title: Text('SOMETHING WENT WRONG'),
                                  content: Text(errMessage),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushReplacementNamed(context, '/');
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  color: Color.fromRGBO(171, 10, 10, 1),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
