import 'package:fllocal/pages/overview_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fllocal/models/fllocal_model.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> _handleSignIn(BuildContext context) async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = await _auth.signInWithCredential(credential);
  print("signed in " + user.displayName);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => OverviewPage(),
    ),
  );
  return user;
}

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
          child: Center(
              child: Column(
                children: [MaterialButton(
              shape: Border.all(width: 2.0, color: Colors.blueAccent),
              onPressed: () =>_handleSignIn,
              child: Text("Sign In with Google"),
      ),
      MaterialButton(
              shape: Border.all(width: 2.0, color: Colors.blueAccent),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OverviewPage())),
              child: Text("Load Overview"),
      )
      ])),
    )
    );
}
}