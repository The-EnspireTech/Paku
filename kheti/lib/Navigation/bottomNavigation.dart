import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      color: Color.fromRGBO(20, 172, 168, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              size: 35.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.crop,
              size: 35.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/cropplan');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.face_retouching_natural,
              size: 35.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/cropcare');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              size: 35.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/market');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.book,
              size: 35.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/news');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 35.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
