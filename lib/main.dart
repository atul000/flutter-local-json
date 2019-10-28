import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.red[200]),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load Json Data"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              // decode json
              var mydata = jsonDecode(snapshot.data.toString());

              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    color: Theme.of(context).primaryColor,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name: " + mydata[index]['name']),
                        new Text("Age: " + mydata[index]['age']),
                        new Text("Height: " + mydata[index]['height']),
                        new Text("Gender: " + mydata[index]['gender']),
                        new Text("Hair Color: " + mydata[index]['hair_color']),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
