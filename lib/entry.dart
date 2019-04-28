import 'package:flutter/material.dart';

void main() => runApp(LauncherApp());

class LauncherApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Hello World",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello world title"),
        ),
        body: Center(
          child: Text("Hello world content"),
        ),
      ),
    );
  }

}