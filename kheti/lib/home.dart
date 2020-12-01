import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

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
  initState() {
    super.initState();
    this.getCurrentLocation();
    Future.delayed(Duration(seconds: 10), () => getWeather());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
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
                Text(windSpeed != null
                    ? windSpeed.toString() + "m/s"
                    : "Loading"),
                Text('\n'),
              ],
            ),
          ),
        ));
  }
}
