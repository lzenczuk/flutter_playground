import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(title: new Text("Hello"),),
        floatingActionButton: new IconButton(icon: new Icon(Icons.add), onPressed: (){ print("Add...");}, color: Colors.blue, ),
      )
    );
  }
}

