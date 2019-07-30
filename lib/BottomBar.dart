import 'package:flutter/material.dart';

import 'ComputerPageWidget.dart';
import 'SecondPage.dart';
import 'TestPage.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomBarState();
  }
}

class BottomBarState extends State<StatefulWidget> {
  int _currentIndex = 1;
  List<Widget> pages = List();

  @override
  initState() => {
      super.initState(),
      pages.add(SecondPage()),
      pages.add(ComputerPageWidget()),
      pages.add(TestPage())
  };

  _onItemTap(index) => {
        setState(() {
          _currentIndex = index;
        })
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment), title: Text("推荐")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("我的")),
          ]),
    );
  }
}
