import 'package:flutter/material.dart';
import 'package:kheti/chatbot.dart';

class CropCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/first': (context) => HomePageDialogflow(),
        },
        title: 'Crop Care',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Crop Care'),
          ),
          body: Center(
            child: Column(
              children: [
                Icon(
                  Icons.chat,
                  color: Colors.purple,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/first');
                  },
                  child: Text("Let's Chat!"),
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ));
  }
}
