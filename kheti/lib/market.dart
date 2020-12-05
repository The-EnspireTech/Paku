import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Market extends StatefulWidget {
  @override
  _WebScraperAppState createState() => _WebScraperAppState();
}

class _WebScraperAppState extends State<Market> {
  List<String> title = List();
  List<String> post = List();
  List<String> link = List();

  void getDataFromWeb() async {
    final response = await http
        .get("https://agromartnepal.com/product-category/plants/fruits/");
    dom.Document document = parser.parse(response.body);

    setState(() {
      final element = document.getElementsByClassName("product-content");
      final content =
          document.getElementsByClassName("woocommerce-Price-amount amount");
      final link2 = document.getElementsByClassName("product-content");

      title =
          element.map((e) => e.getElementsByTagName("a")[0].innerHtml).toList();
      post = content
          .map((e) => e.getElementsByTagName("span")[0].innerHtml)
          .toList();
      link = link2
          .map((e) => e.getElementsByTagName("a")[0].attributes['href'])
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromWeb();
    // Requesting to fetch before UI drawing starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Market"),
      ),
      body: post.length == 0
          ? Text(
              "Loading......",
              style: TextStyle(color: Colors.blue),
            )
          : ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: Duration(milliseconds: 600),
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () async {
                            dynamic url = link[index];
                            if (await canLaunch(url)) {
                              launch(url);
                            } else {
                              print("error");
                            }
                          },
                          child: Card(
                            child: Container(
                              color: Colors.teal[500],
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(title[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20)),
                                  ),
                                  Text(
                                    post[index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ));
              },
            ),
    );
  }
}
