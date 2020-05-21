import 'package:ereny_pacy_app/agbya/agbya_home_screen.dart';
import 'package:ereny_pacy_app/khadem/home_screen.dart';
import 'package:flutter/material.dart';

class HomeScren extends StatelessWidget {
  static const ROUTE_NAME = "/home-screen";
  const HomeScren({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ereny Pacy"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "اجبيه",
              textAlign: TextAlign.end,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AgbyaHomePage.ROUTE_NAME);
            },
          ),
          ListTile(
            title: Text(
              "الخادم",
              textAlign: TextAlign.end,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(KhademHomePage.ROUTE_NAME);
            },
          )
        ],
      ),
    );
  }
}
