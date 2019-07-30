import 'package:flutter/material.dart';

void main() => runApp(LauncherApp());

class LauncherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    _goMainPage() => {
      Navigator.pushNamedAndRemoveUntil(context, "/bottomBar",(route) => route == null),
};
    // TODO: implement build
    return new MaterialApp(
      title: "Hello World",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello world title"),
        ),
        body: GestureDetector(
          child: Center(
            child: Text("Hello world content"),
          ),
          onTap: _goMainPage,
        ),
      ),
    );
  }
}
