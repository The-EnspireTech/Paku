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
  static String location = "";
  static String temperature = "";
  static String pressure = "";
  static String humidity = "";
  static String wind = "";
  static String description = "";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
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
    print(results);
    setState(() {
      location = "${first.locality}";
      temperature = "${results['main']['temp']}";
      pressure = "${results['main']['pressure']}";
      humidity = "${results['main']['humidity']}";
      wind = "${results['wind']['speed']}";
      description = "${results['weather'][0]['description']}";
    });
    _getCurrentLocation();
  }

  static TextStyle optionStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
  static List<Widget> widgetOptions = <Widget>[
//----------------------------Home Pagge ------------------------------------
    Container(
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Text("\n"),
              Icon(
                Icons.location_pin,
                color: Colors.red,
              ),
              Text("Live Location: $location" + "\n\n")
            ],
          ),
          Row(
            children: [
              Text("\n\n"),
              Icon(
                Icons.thermostat_outlined,
                color: Colors.blue,
              ),
              Text("Temperature: $temperature")
            ],
          ),
          Row(
            children: [
              Text("\n\n"),
              Icon(
                Icons.cloud,
                color: Colors.grey,
              ),
              Text("Pressure: $pressure")
            ],
          ),
          Row(
            children: [
              Text("\n\n"),
              Icon(
                Icons.cloud_circle,
                color: Colors.pinkAccent,
              ),
              Text("Humidity: $humidity")
            ],
          ),
          Row(
            children: [
              Text("\n\n"),
              Icon(
                Icons.cloud_download,
                color: Colors.purple,
              ),
              Text("Wind: $wind")
            ],
          ),
          Row(
            children: [
              Text("\n\n"),
              Icon(
                Icons.textsms,
                color: Colors.green,
              ),
              Text("Description: $description")
            ],
          ),
        ],
      ),
      padding: EdgeInsets.all(10.0),
    ),

    Container(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          Column(
            children: [
              Icon(
                Icons.rice_bowl,
                color: Colors.purple,
                size: 40,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text("Apple"),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Banana'),
            color: Colors.teal[200],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Orange'),
            color: Colors.teal[300],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Mango'),
            color: Colors.teal[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('PineApple'),
            color: Colors.teal[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Grapes'),
            color: Colors.teal[600],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Palm'),
            color: Colors.teal[600],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Pear'),
            color: Colors.teal[600],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Guava'),
            color: Colors.teal[600],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('BlackBerry'),
            color: Colors.teal[600],
          ),
        ],
      ),
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
      body: Container(
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
            backgroundColor: Color.fromRGBO(20, 172, 168, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_rounded),
            label: 'Crop Care',
            backgroundColor: Color.fromRGBO(20, 172, 168, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Market',
            backgroundColor: Color.fromRGBO(20, 172, 168, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'News',
            backgroundColor: Color.fromRGBO(20, 172, 168, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color.fromRGBO(20, 172, 168, 1),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
