import 'package:flutter/material.dart';
import 'ComputerPageWidget.dart';
import 'MainPager.dart';
import 'entry.dart';
import 'DetailWidget.dart';
import 'BottomBar.dart';

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new LauncherApp(),
    routes:<String,WidgetBuilder>{
      '/entry':(BuildContext context)=>LauncherApp(),
      '/main':(BuildContext context)=>MainPager(),
      '/compute':(BuildContext context)=>ComputerWidget(),
      '/detail':(BuildContext context)=>DetailWidget(),
      '/bottomBar':(BuildContext context)=>BottomBar(),
    },
  ));
}

