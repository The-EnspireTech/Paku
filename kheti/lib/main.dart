import 'package:flutter/material.dart';
import 'package:kheti/chatbot.dart';
import 'package:kheti/cropCare.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/first': (context) => HomePageDialogflow(),
      '/second': (context) => CropCare(),
    }, home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                RaisedButton(
                  child: Text('Go to chat'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/first');
                  },
                  color: Colors.blue,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Go To Crop Plan"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  color: Colors.purple,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Go To Market"),
                  onPressed: () {
                    Navigator.pushNamed(context, '');
                  },
                  color: Colors.pink,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Go To News"),
                  onPressed: () {
                    Navigator.pushNamed(context, '');
                  },
                  color: Colors.orange,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Go To Profile"),
                  onPressed: () {
                    Navigator.pushNamed(context, '');
                  },
                  color: Colors.green,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
