import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fllocal/models/fllocal_model.dart';

class StartPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    String title = ScopedModel.of<FllocalModel>(context).title;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Text("Start page")
    );
  }
}
