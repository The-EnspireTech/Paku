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
            size: Size(56, 56), // button width and height
            child: ClipOval(
              child: Material(
                color: Colors.purpleAccent, // button color
                child: InkWell(
                  splashColor: Colors.blue, // splash color
                  onTap: () {}, // button pressed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.rice_bowl,
                        color: Colors.white,
                      ), // icon
                      Text("Rice"), // text
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
