import 'package:flutter/material.dart';
import 'package:kheti/Navigation/bottomNavigation.dart';
import 'package:url_launcher/url_launcher.dart';

class CropCare extends StatelessWidget {
  void _launchCaller(int number) async {
    var url = "tel:${number.toString()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Care'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(20, 172, 168, 1),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(100.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.purple, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {
                            Navigator.pushNamed(context, '/chat');
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.message,
                                color: Colors.white,
                              ), // icon
                              Text("Chat"), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text("\n"),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {
                            _launchCaller(9867330664);
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.call,
                                color: Colors.white,
                              ), // icon
                              Text("Call"),
                              // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text("\n"),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.pink, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {
                            Navigator.pushNamed(context, '/detection');
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.camera_front,
                                color: Colors.white,
                              ), // icon
                              Text("Detect"),
                              // text
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
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
