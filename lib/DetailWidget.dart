import 'package:flutter/material.dart';
import 'TitleBar.dart';

class DetailWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleBar(title:"详情页面"),),
      body: Center(child: Text("数据详情")),
    );
  }
}