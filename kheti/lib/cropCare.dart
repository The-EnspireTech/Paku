import 'package:flutter/material.dart';
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
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(100.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.lightBlueAccent,
                          size: 80,
                        )
                      ],
                    ),
                  ),
                  Text('\n\n'),
                  Container(
                    child: Column(
                      children: [
                        RaisedButton(
                          child: Text('Chat'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/chat');
                          },
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  Text("\n\n\n"),
                  Container(
                    child: Column(
                      children: [
                        RaisedButton(
                          child: Text(
                            "Call",
                          ),
                          onPressed: () {
                            _launchCaller(9867330664);
                          },
                          color: Colors.purple,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
