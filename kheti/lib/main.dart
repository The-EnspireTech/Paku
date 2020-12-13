import 'package:flutter/material.dart';
import 'package:kheti/chatbot.dart';
import 'package:kheti/cropCare.dart';
import 'package:kheti/cropPlan.dart';
import 'package:kheti/description.dart';
import 'package:kheti/detection.dart';
import 'package:kheti/home.dart';
import 'package:kheti/login.dart';
import 'package:kheti/market.dart';
import 'package:kheti/news.dart';
import 'package:kheti/Splash/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kheti - The Farmer's Choice",
      routes: {
        '/main': (context) => MyApp(),
        '/home': (context) => Home(),
        '/cropcare': (context) => CropCare(),
        '/chat': (context) => HomePageDialogflow(),
        '/cropplan': (context) => CropPlan(),
        '/market': (context) => Market(),
        '/news': (context) => News(),
        '/login': (context) => LoginWithFacebook(),
        '/description': (context) => Description(),
        '/detection': (context) => Detection(),
      },
      home: SplashScreen(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 100, 60, 10),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                RaisedButton(
                  child: Text('Go to Home'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  color: Colors.teal,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                RaisedButton(
                  child: Text('Go to Crop Plan'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cropplan');
                  },
                  color: Colors.blue,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Go to Crop Care"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cropcare');
                  },
                  color: Colors.purple,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Go to Market"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/market');
                  },
                  color: Colors.pink,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Go to News"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/news');
                  },
                  color: Colors.orange,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Go to Profile"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
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
