import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fllocal/models/fllocal_model.dart';

class LoginSignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  @override
  Widget build(BuildContext context) {
    String title = ScopedModel.of<FllocalModel>(context).title;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("$title"),
      ),
      body: new Container(
        child: new Text("Hello World"),
      ),
    );
  }
}
