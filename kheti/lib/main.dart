import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Kheti - The farmers choice';

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
  static String message = "";
  //-----------------------------------------------------------------------------------
  // Longitude and latitude

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    setState(() {
      message = "${first.featureName[1]}";
    });
  }

  //---------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(20, 172, 168, 1),
      ),
      body: Container(
        child: Column(
          children: [
            Icon(
              Icons.person_pin_circle,
              color: Colors.redAccent,
              size: 40.0,
            ),
            Text("\nSandhikharka" + "\n\n"),
            Icon(
              Icons.circle,
              color: Colors.purple,
              size: 50,
            ),
            Icon(
              Icons.circle,
              color: Colors.blue,
              size: 50,
            ),
            Text("Precipitation"),
            Icon(
              Icons.circle,
              color: Colors.green,
              size: 50,
            ),
            Text("Humidity"),
            Icon(
              Icons.circle,
              color: Colors.grey,
              size: 50,
            ),
            Text("Wind"),
          ],
        ),
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
            icon: Icon(Icons.medical_services_outlined),
            label: 'Crop Care',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
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
      ),
    );
  }
}
