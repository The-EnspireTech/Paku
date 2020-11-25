import 'package:flutter/material.dart';

class CropPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crop Plan'),
        ),
        body: Container(
          child: SizedBox.fromSize(
            size: Size(56, 56), // button width and height
            child: ClipOval(
              child: Material(
                color: Colors.orange, // button color
                child: InkWell(
                  splashColor: Colors.green, // splash color
                  onTap: () {}, // button pressed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.call), // icon
                      Text("Call"), // text
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
