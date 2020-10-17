import 'package:flutter/material.dart';
import 'package:find_me/screens/login_screen.dart';
import 'package:find_me/screens/mainpage_screen.dart';
import 'package:find_me/screens/registration_screen.dart';
import 'package:find_me/screens/welcome_screen.dart';
import 'package:find_me/screens/card_screen.dart';


void main() => runApp(FindMe());

class FindMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          CardScreen.id: (context) => CardScreen(profile:null),
          MainPage.id: (context) => MainPage(),
        },

    );
  }
}
