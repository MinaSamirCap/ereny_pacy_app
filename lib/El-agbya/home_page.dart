import 'package:flutter/material.dart';

import 'baker/text.dart';
import 'widget/hour_home.dart';

class AgbyaHomePage extends StatefulWidget {
  static const ROUTE_NAME = "/agbya-home-screen";

  AgbyaHomePage({Key key}) : super(key: key);

  @override
  _AgbyaHomePageState createState() => _AgbyaHomePageState();
}

class _AgbyaHomePageState extends State<AgbyaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "باكر",
              textAlign: TextAlign.end,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return HourHome(
                    mainTitle: BakerValues.mainTitle,
                    titels: BakerValues.titels,
                    content: BakerValues.content);
              }));
            },
          ),
          ListTile(
            title: Text(
              "الثالثه",
              textAlign: TextAlign.end,
            ),
          ),
          ListTile(
            title: Text(
              "السادسه",
              textAlign: TextAlign.end,
            ),
          ),
          ListTile(
            title: Text(
              "التاسعة",
              textAlign: TextAlign.end,
            ),
          ),
          ListTile(
            title: Text(
              "الغروب",
              textAlign: TextAlign.end,
            ),
          ),
          ListTile(
            title: Text(
              "النوم",
              textAlign: TextAlign.end,
            ),
          ),
          ListTile(
            title: Text(
              "نصف الليل",
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
