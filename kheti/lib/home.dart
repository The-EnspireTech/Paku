import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crop Care'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(100.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.lightBlueAccent,
                          size: 80,
                        )
                      ],
                    ),
                  ),
                  Text('\n\n'),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: SizedBox.fromSize(
                      size: Size(56, 56), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.purple, // button color
                          child: InkWell(
                            splashColor: Colors.green, // splash color
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.message), // icon
                                Text("Chat"), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("\n\n\n"),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: SizedBox.fromSize(
                      size: Size(56, 56), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.blue, // button color
                          child: InkWell(
                            splashColor: Colors.green, // splash color
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
