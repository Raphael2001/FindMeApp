import 'package:find_me/components/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:find_me/screens/searchpage_screen.dart';

class MainPage extends StatelessWidget {
  static const String id = '/mainpage';
  static const String _title = 'Find Me';

  final _auth = FirebaseAuth.instance;

  FirebaseUser loggedInUser;

  Future<FirebaseUser> getCurrentUser() async {
    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        return loggedInUser;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }



  Widget build(context) {
    return FutureBuilder<FirebaseUser>(
        future: getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return Provider<FirebaseUser>(
              create: (context) => loggedInUser,
              child: MaterialApp(
                title: _title,
                home: SearchPage(),
              ),
            );
          } else {
            return CircularProgressIndicator(

            );
          }
        });
  }
}
