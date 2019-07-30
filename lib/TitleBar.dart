import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  String title = "";
  BuildContext context;
  Function rightTap;
  IconData rightIcon;

  TitleBar({String title: "", BuildContext context,IconData rightIcon ,Function rightTap}) {
    this.title = title;
    this.context = context;
    this.rightTap = rightTap;
    this.rightIcon = rightIcon;
  }

  void _onBackPressed() {
    //TODO : 关闭页面
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new IconButton(
            icon: Icon(null), onPressed: _onBackPressed),
        new Expanded(
            child: new Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.title)),
        new IconButton(icon: new Icon(rightIcon), onPressed: rightTap)
      ],
    );
  }
}
