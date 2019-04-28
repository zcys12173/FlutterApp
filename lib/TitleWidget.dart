import 'package:flutter/material.dart';

class TitleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TitleState();
  }
}

class TitleState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Row(
        children: <Widget>[
          new Image.asset(
            'images/icon_back.png',
            width: 80.0,
            height: 80.0,
          )
        ],
      ),
    );
  }
}
