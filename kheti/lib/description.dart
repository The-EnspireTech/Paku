import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class Description extends StatefulWidget {
  Description({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Description createState() => _Description();
}

class _Description extends State<Description> {
  VoiceController _voiceController;

  String text = 'An apple is an edible fruit produced by an apple tree.'
      'Apple trees are cultivated worldwide and are the most'
      'widely grown species in the genus Malus.'
      'The tree originated in Central Asia, where its wild'
      'ancestor, Malus sieversii, is still found today.';

  @override
  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _voiceController.stop();
  }

  _playVoice() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text,
        VoiceControllerOptions(),
      );
    });
  }

  _stopVoice() {
    _voiceController.stop();
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Container(
        child: Row(
          children: [
            Expanded(
              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Apple',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Fruit',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            /*3*/
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            Text('41'),
            Expanded(
              child: Container(
                child: Column(
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.thumb_up, 'LIKE'),
          _buildButtonColumn(color, Icons.near_me, 'SEND'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(text),
            Text('\n'),
            RaisedButton(
              onPressed: _playVoice,
              color: Colors.blue,
              child: Icon(Icons.play_arrow),
            ),
            RaisedButton(
                onPressed: _stopVoice,
                color: Colors.red,
                child: Icon(Icons.stop)),
          ],
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Apple'),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/apple.jpg',
            width: 400,
            height: 100,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
