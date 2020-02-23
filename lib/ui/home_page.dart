import 'package:ereny_pacy_app/El-agbya/home_page.dart';
import 'package:flutter/material.dart';

class HomeScren extends StatelessWidget {
  static const ROUTE_NAME = "/home-screen";
  const HomeScren({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          )
        ],
      ),
    );
  }
}
