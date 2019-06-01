import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'new_post_page.dart';

class OverviewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
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
        body: Container(
          child: StreamBuilder(
            stream: Firestore.instance.collection('posts').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.amberAccent),
                  ),
                );
              } else {
                return ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemBuilder: (context, index) =>
                      buildItem(context, snapshot.data.documents[index]),
                  itemCount: snapshot.data.documents.length,
                );
              }
            },
          ),
        ));
  }

  Widget buildItem(BuildContext context, document) {
    return Card(child: Text(document.data['header']));
  }

  _addPost() {
    var databaseRef = Firestore.instance.collection('posts');

    databaseRef.add({
      'topic': 'questions',
      'header': 'Header ${DateTime.now().microsecond}',
      'body': 'Message ${DateTime.now().microsecond}'
    });
  }
}
