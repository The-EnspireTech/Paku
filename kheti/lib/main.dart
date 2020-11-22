import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Kheti-The farmers choice';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static String message = "";
  static String temperature = "";
  static String pressure = "";
  static String humidity = "";
  static String wind = "";
  static String description = "";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    print(temperature);
  }

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=Thada&appid=6829005ae98e929e814158d91327a6db");
    var results = jsonDecode(response.body);

    setState(() {
      message = "${first.locality}";
      temperature = "${results['main']['temp']}";
      pressure = "${results['main']['pressure']}";
      humidity = "${results['main']['humidity']}";
      wind = "${results['wind']['speed']}";
      description = "${results['weather'][0]['description']}";
    });
  }

  static TextStyle optionStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.normal);
  static List<Widget> widgetOptions = <Widget>[
    Text(
      'Current Location: ' +
          message +
          "\n\n" +
          'Temperature: ' +
          temperature +
          '\n\n' +
          'Pressure: ' +
          pressure +
          '\n\n' +
          'Humidity: ' +
          humidity +
          '\n\n' +
          'Wind: ' +
          wind +
          '\n\n' +
          'Description: ' +
          description +
          '\n\n',
      style: optionStyle,
    ),
    Text(
      "Hello world",
      style: optionStyle,
    ),
    Text(
      'Index 2: Crop Care',
      style: optionStyle,
    ),
    Text(
      'Index 3: Market',
      style: optionStyle,
    ),
    Text(
      'Index 4: News',
      style: optionStyle,
    ),
    Text(
      'Index 5: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(20, 172, 168, 1),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromRGBO(20, 172, 168, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop),
            label: 'Crop Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_rounded),
            label: 'Crop Care',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
