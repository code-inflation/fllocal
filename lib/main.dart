// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:fllocal/pages/overview_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fllocal/pages/login_signup_page.dart';
import 'package:fllocal/pages/post_page.dart';
import 'package:fllocal/pages/new_post_page.dart';

import 'models/fllocal_model.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Fllocal';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<FllocalModel>(
      model: FllocalModel(),
      child: MaterialApp(title: 'Scoped Model Demo', home: LoginSignUpPage()),
    );
  }
}
