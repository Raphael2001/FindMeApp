import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_me/components/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../constants.dart';
import 'mainpage_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  bool showTextProblem = false;
  String email, password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: kLogInButtonColor,
                text: 'Log In',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                    showTextProblem = false;

                  });
                  try {
                    final newuser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (newuser != null) {
                      Navigator.pushNamed(context, MainPage.id);
                      showSpinner = false;
                    }
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                      showTextProblem = true;
                    });
                    print(e);
                  }
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              showTextProblem
                  ? Center(
                      child: Text(
                        'A problem was occurred ',
                        style: kProblemTextStyle,
                      ),
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
