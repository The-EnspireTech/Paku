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

  String text = 'Apple\n\n'
      'An apple is an edible fruit produced by an apple tree.'
      'Apple trees are cultivated worldwide and are the most'
      'widely grown species in the genus Malus.'
      'The tree originated in Central Asia, where its wild'
      'ancestor, Malus sieversii, is still found today.'
      '\n\n'
      'Types of Apple'
      '\n\n'
      '1. Jonagold Apple\n'
      '2. Cameo Apple\n'
      '3. Empire Apple\n'
      '4. McIntosh Apple\n'
      '5. Golden Delicious Apple\n'
      '6. Fiji Apple\n'
      '7. Cortland Apple\n'
      '\n\n'
      'Currently we are facing various types of disease in apple.'
      'The disease is attacking apple trees as well as apple fruits.\n\n'
      'Common Diseases of Apple Trees\n\n'
      '1. Apple Scab\n'
      '2. Powdery Mildew\n'
      '3. Black Rot\n'
      '4. Apple Rusts\n'
      '5. Collar Rot\n'
      '6. Sooty Blotch\n'
      '7. Flyspeck\n'
      '8. Fire Blight\n\n'
      'Now it is the time to deal with those diseases.'
      'How can we deal with them?';

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
          _buildButtonColumn(
            color,
            Icons.thumb_up,
            'LIKE',
          ),
          _buildButtonColumn(color, Icons.near_me, 'SEND'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            RaisedButton(
              onPressed: _playVoice,
              color: Colors.blue,
              child: Icon(Icons.play_arrow),
            ),
            RaisedButton(
                onPressed: _stopVoice,
                color: Colors.red,
                child: Icon(Icons.stop)),
            Text('\n'),
            Text(text),
          ],
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Apple'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(20, 172, 168, 1),
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
