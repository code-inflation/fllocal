import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fllocal/models/fllocal_model.dart';

class PostPage extends StatefulWidget {
  final Post post;
  PostPage({@required this.post}) : super();

  @override
  State<StatefulWidget> createState() => new _PostPageState(post: post);
}

class _PostPageState extends State<PostPage> {
  final Post post;
  _PostPageState({@required this.post}) : super();
  @override
  Widget build(BuildContext context) {
    String title = ScopedModel.of<FllocalModel>(context).title;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Container(
              child: Text(post.postTitle),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10.0),
              color: Colors.yellow,
              height: 28.0,
            ),
          ),
          Center(
            child: Container(
              child: Text(post.author),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10.0),
              color: Colors.yellow,
              height: 28.0,
            ),
          ),
          Center(
            child: Container(
              child: Text("TODO:formating:" + post.now.toString()),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10.0),
              color: Colors.yellow,
              height: 28.0,
            ),
          ),
          Center(
            child: Container(
              child: Text(post.postMessage),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10.0),
              color: Colors.yellow,
              height: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
