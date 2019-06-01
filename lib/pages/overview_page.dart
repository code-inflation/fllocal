import 'package:fllocal/models/fllocal_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class OverviewPage extends StatefulWidget{

  @override

  State<StatefulWidget> createState() => new _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  @override
  Widget build(BuildContext context){
    String title = ScopedModel.of<FllocalModel>(context).title;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("$title"),
      ),
      body: new Container(
        child: new Text("Overview"),
      ),
    );
  }
}
