import 'package:fllocal/models/fllocal_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'new_post_page.dart';

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
      body: new Text("Start page"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPostPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
