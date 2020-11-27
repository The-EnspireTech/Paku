import 'package:flutter/material.dart';

class CropPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Plan'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SizedBox.fromSize(
          size: Size(100, 100), // button width and height
          child: ClipOval(
            child: Material(
              color: Colors.white, // button color
              child: InkWell(
                splashColor: Colors.green, // splash color
                onTap: () {
                  Navigator.pushNamed(context, '/description');
                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/apple.jpg',
                      width: 50,
                      height: 50,
                    ), // icon
                    Text("Apple"), // text
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
