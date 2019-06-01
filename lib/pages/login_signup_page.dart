import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginSignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter login demo"),
      ),
      body: new Container(
          child: Center(
              child: MaterialButton(
              shape: Border.all(width: 2.0, color: Colors.blueAccent),
              onPressed: _handleSignIn,
              child: Text("Login"),
      ))),
    );
  }
}
