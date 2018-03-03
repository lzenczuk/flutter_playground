import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final wordPair = new WordPair.random();

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }

}

class RandomWordsState extends State<RandomWords>{

  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Randowm word pairs"),),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return new ListView.builder(itemBuilder: (context, i){
      if(i.isOdd) return new Divider();

      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair wordPair){

    final alreadySaved = _saved.contains(wordPair);

    Widget savedIcon;
    if(alreadySaved){
      savedIcon = new IconButton(icon: new Icon(Icons.favorite), color: Colors.red,);
    }else{
      savedIcon = new IconButton(icon: new Icon(Icons.favorite_border));
    }

    return new ListTile(
      title: new Text(wordPair.asPascalCase),
      trailing: savedIcon,
    );
  }

}