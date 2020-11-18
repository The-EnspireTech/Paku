import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'sandhikharka',
      //style: optionStyle,
    ),
    Text(
      'Index 1: Crop Plan',
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
    )
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
          title: const Text(
            'Home',
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(20, 172, 168, 1)),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
