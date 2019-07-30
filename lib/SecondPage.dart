import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/TitleBar.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RandomWords();
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final __suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: TitleBar(title: "首页", context: context, rightTap: null),
      ),
      body: _buildSuggestion(),
    );
  }

  Widget _buildSuggestion() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该行书湖添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= __suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            __suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(__suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    void _onTap(){
      Navigator.pushNamed(context, "/detail");
    }
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: _onTap,
    );
  }
}
