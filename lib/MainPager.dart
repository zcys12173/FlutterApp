import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SecondPage.dart';
import 'ComputerPageWidget.dart';
import 'TestPage.dart';

class MainPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的")),
          BottomNavigationBarItem(icon: Icon(Icons.android), title: Text("推荐")),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return SecondPage();
                break;
              case 1:
                return ComputerWidget();
                break;
              case 2:
                return TestPage();
                break;
              default:
                return TestPage();
                break;
            }
          },
        );
      },
    );
  }
}

