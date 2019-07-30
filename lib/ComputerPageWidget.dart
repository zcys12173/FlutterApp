import 'package:flutter/material.dart';
import 'package:flutter_app/TitleBar.dart';
import 'dart:convert' show json;
import 'Compute.dart';

/// 计算器页面
class ComputerPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ComputerWidget();
  }
}

class ComputerWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new ComputerState();
  }
}

class ComputerState extends State<StatefulWidget> with Compute {
  _onTitleRightClick() {
    print("onRightClick");
  }

  String content = "";

  var list = ["C", "+", "-", "*","1", "2", "3", "/","4", "5", "6", "=","7", "8", "9",".","0"];

  void _onItemClick(String text) {
    onTextChanged(text: text,onComputeFinish: (String content){
      if(content.contains(".")){
        for(int i = content.length-1;i>1;i--){
          if(content[i] == "0"){
            content = content.substring(0,i-1);
          }else{
            break;
          }
        }
      }
      setState(() {
        this.content = content;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
          title: new TitleBar(
              title: "计算器", context: context,rightIcon: Icons.menu, rightTap: _onTitleRightClick)),
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(
                  child: new Container(
                child: Text(content,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0),),
                padding: const EdgeInsets.all(10.0),
                height: 300.0,
                alignment: AlignmentDirectional.center,
                color: Colors.cyanAccent,
              ))
            ],
          ),
          new Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(0.0),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0),
              itemBuilder: (BuildContext context, int index) {
                return ItemWidget(list[index], _onItemClick);
              },
              itemCount: list.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  final String text;
  final Function onClick;

  ItemWidget(this.text, this.onClick);

  @override
  State<StatefulWidget> createState() {
    return new ItemState(text, onClick);
  }
}

class ItemState extends State<StatefulWidget> {
  final String text;
  Function onClick;

  ItemState(this.text, this.onClick);

  _onClick() {
    if (onClick != null) {
      onClick(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        child: new Container(
          child: new Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontSize: 20.0),
          ),
          color: Colors.black,
          alignment: AlignmentDirectional.center,
        ),
        onTap: _onClick);
  }
}
