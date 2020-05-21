import 'package:flutter/material.dart';

class KhademHomePage extends StatefulWidget {
  static const ROUTE_NAME = "/khadem-home-screen";

  @override
  _KhademHomePageState createState() => _KhademHomePageState();
}

class _KhademHomePageState extends State<KhademHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text("الخادم"),
    );
  }

  Column body() {
    return Column(
      children: <Widget>[
        introWidget(),
        yearsWidget()
      ],
    );
  }

  Expanded yearsWidget() {
    return Expanded(
          child: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
          );
        },
      ));
  }

  Container introWidget() {
    return Container(
        height: 300,
        color: Colors.green,
        width: double.infinity,
      );
  }
}
