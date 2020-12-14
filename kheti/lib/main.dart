import 'package:flutter/material.dart';
import 'package:kheti/CropCare/Chat/chatbot.dart';
import 'package:kheti/CropCare/cropCare.dart';
import 'package:kheti/CropPlan/cropPlan.dart';
import 'package:kheti/CropPlan/Description/description.dart';
import 'package:kheti/CropCare/Detect/detection.dart';
import 'package:kheti/Login/login.dart';
import 'package:kheti/Market/market.dart';
import 'package:kheti/News/news.dart';
import 'package:kheti/Splash/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:kheti/Navigation/bottomNavigation.dart';

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

class Home extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<Home> {
  var loc;
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      this.loc = "${first.locality}";
    });
  }

  getWeather() async {
    if (loc != "") {
      http.Response response = await http.get(
          "http://api.openweathermap.org/data/2.5/weather?q=Thada&units=metric&appid=6829005ae98e929e814158d91327a6db");

      var results = jsonDecode(response.body);
      setState(() {
        this.temp = "${results['main']['temp']}";
        this.description = "${results['weather'][0]['description']}";
        this.currently = "${results['weather'][0]['main']}";
        this.humidity = "${results['main']['humidity']}";
        this.windSpeed = "${results['wind']['speed']}";
      });
    } else {
      print("Unable to find location!");
    }
  }

  @override
  initState() async {
    super.initState();
    this.getCurrentLocation();
    //delaying weather data by 7 seconds.
    await Future.delayed(Duration(seconds: 7), () => getWeather());
    //getting the push notifications.
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(20, 172, 168, 1),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Icon(Icons.person_pin, color: Colors.red),
              Text("Live Location"),
              Text(loc != null ? loc.toString() : "Loading"),
              Text('\n'),
              Text("Current Temprature"),
              Text(temp != null ? temp.toString() + "°C" : "Loading"),
              Text('\n'),
              Text("Weather Description"),
              Text(description != null ? description.toString() : "Loading"),
              Text('\n'),
              Text("Humidity"),
              Text(humidity != null ? humidity.toString() + "%" : "Loading"),
              Text('\n'),
              Text("Wind Speed"),
              Text(
                  windSpeed != null ? windSpeed.toString() + "m/s" : "Loading"),
              Text('\n\n'),
              Text("Crop Recommendation system is in pending.......!!!")
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
