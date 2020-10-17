import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMainTextColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMainTextColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTextFiledInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.blueGrey,
  prefixIcon: Icon(
    Icons.search,
    color: Colors.teal,
  ),
  hintText: 'Find My Friends',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
    borderSide: BorderSide(color: Colors.yellow),
  ),
);

const kBackgroundColor = Color.fromRGBO(41, 44, 51, 10);

const kMainTextColor = Colors.teal;

const kIconColor = Colors.teal;

const kTextColor = Colors.yellowAccent;

const kSecTextColor = Colors.white;

const kAppBarColor = Color.fromRGBO(37, 37, 37, 1);

const kBottomAppBarTextColor = Color(0xFF00695C);

const kMainTextColorShade = Color(0xFF004D40);

const kButtonBackgroundColor = Colors.white;

const kCardBackgroundColor = Colors.white;

const kRegisterButtonColor = Color(0xFF606060);

const kLogInButtonColor = Color(0xFFFFC815);

const kButtonTextStyle = TextStyle(
  color: kMainTextColorShade,
  fontFamily: 'Source Sans Pro',
  fontSize: 20.0,
);

const kCardTextStyle = TextStyle(
  color: kMainTextColorShade,
  fontSize: 20.0,
);

const kTileTextStyle = TextStyle(
  color: kMainTextColorShade,
 // fontFamily:,
);

const kJobDesTileTextStyle = TextStyle(
  color: kLogInButtonColor,
  // fontFamily:,
);

const kTextStyle = TextStyle(
  fontSize: 30.0,
  color: kMainTextColorShade,
);

const kTextStyle2 = TextStyle(
  fontSize: 16.0,
  color: kMainTextColorShade,
);
const kNameTextStyle = TextStyle(
  color: kSecTextColor,
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

const kJobDesTextStyle = TextStyle(
  color: kTextColor,
  fontSize: 20.0,
  letterSpacing: 2.5,
  fontWeight: FontWeight.bold,
);

const kProblemTextStyle = TextStyle(
  color: Colors.red,
  fontSize: 20.0,
  letterSpacing: 2.5,
);

const kMyProfileTextStyle = TextStyle(
  color: kSecTextColor,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);