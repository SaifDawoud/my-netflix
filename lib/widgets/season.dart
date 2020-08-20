import 'package:flutter/material.dart';

class Season extends StatelessWidget {
  final String title;
  final String imageUrl;

  Season({this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(

        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Container(

          alignment: Alignment.centerLeft,
          height: 90,
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color:Color.fromRGBO(171, 10, 10, 1) ,
                    blurRadius:8 ,
                    //offset: Offset(2,2),
                  spreadRadius: 1
            )
              ],
              //  border: Border.all(color: Colors.red),
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover)
),
          child: Container(color: Colors.black38,
            height: 90,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20,top: 30),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(fontFamily: 'SF-Pro-Display-Regular.otf',color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
