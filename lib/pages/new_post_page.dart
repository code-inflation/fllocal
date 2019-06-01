import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fllocal/models/fllocal_model.dart';
import 'package:fllocal/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class NewPostPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    String title = ScopedModel.of<FllocalModel>(context).title;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("$title"),
      ),
      body: NewPostForm(),
    );
  }
}

// Create a Form Widget
class NewPostForm extends StatefulWidget {
  @override
  NewPostFormState createState() {
    return NewPostFormState();
  }
}

class NewPostFormState extends State<NewPostForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _newPostKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final postTitle = TextEditingController();
    final postMessage = TextEditingController();

    return Form(
      key: _newPostKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: postTitle,
            decoration: InputDecoration(
              labelText: 'Post title',
            ),
          ),
          TextFormField(
            controller: postMessage,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Type text...',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please some text ..';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: MaterialButton(
              shape: Border.all(width: 2.0, color: Colors.blueAccent),
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_newPostKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }

                Post post = new Post(
                    postTitle.text,
                    postMessage.text,
                    new DateTime.now(),
                    ScopedModel.of<FllocalModel>(context).displayName);
                ScopedModel.of<FllocalModel>(context).posts.add((post));

                CollectionReference posts =
                    Firestore.instance.collection('posts');
                posts.add(post.toJson());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPage(post: post),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
