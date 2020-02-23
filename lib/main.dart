import 'package:flutter/material.dart';

import 'package:ereny_pacy_app/ui/home_page.dart';
import 'El-agbya/home_page.dart';
import 'ui/login_page.dart';

const String APP_NAME = 'Ereny Pacy';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomeScren.ROUTE_NAME: (ctx) => HomeScren(),
        AgbyaHomePage.ROUTE_NAME: (ctx) => AgbyaHomePage()
      },
      home: AgbyaHomePage(),
    );
  }
}

class DummyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: Center(child: Text(APP_NAME)),
    );
  }
}
