import 'package:ereny_pacy_app/utils/backdrop.dart';
import 'package:flutter/material.dart';

class HourHome extends StatefulWidget {
  static const ROUTE_NAME = "/baker-home-screen";
  final String mainTitle;
  final List<String> titels;
  final List<Map<String, String>> content;

  const HourHome(
      {@required this.mainTitle,
      @required this.titels,
      @required this.content});
  @override
  _HourHomeState createState() => _HourHomeState();
}

class _HourHomeState extends State<HourHome> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      title: Text(widget.mainTitle),
      iconPosition: BackdropIconPosition.action,
      frontLayer: contentWidgets(),
      stickyFrontLayer: true,
      backLayer: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: BackdropNavigationBackLayer(
          items: widget.titels.map((titile) {
            return Text(
              titile,
              style: TextStyle(color: Colors.white, fontSize: 20),
            );
          }).toList(),
          onTap: (int position) => {controller.jumpToPage(position)},
        ),
      ),
    );
  }

  Widget contentWidgets() {
    return PageView.builder(
      itemBuilder: (BuildContext context, int index) {
        List<String> keys = widget.content[index].keys.toList();
        return Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: keys.length,
              itemBuilder: (BuildContext context, int idx) {
                String val = widget.content[index][keys[idx]];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    children: <Widget>[
                      if (idx != 0) Divider(),
                      Text(
                        "${keys[idx]}",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        "$val",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              },
            ));
      },
      itemCount: widget.content.length,
      reverse: true,
      controller: controller,
      onPageChanged: (num) {
        // print("Change:" + controller.position.toString());
      },
    );
  }
}
