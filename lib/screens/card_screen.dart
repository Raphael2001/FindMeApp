import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:find_me/components/profile.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CardScreen extends StatelessWidget {
  static const String id = '/card';
  Profile profile;

 CardScreen({this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.transparent,
            backgroundImage: profile.photo != null
                ? Image
                .network(profile.photo)
                .image
                : Icon(
              Icons.person,
              color: kIconColor,
            ),
          ),
          Text(
            profile.name,
            style: GoogleFonts.pacifico(textStyle: kNameTextStyle),
          ),
          Text(
            profile.jobDes.toUpperCase(),
            style: GoogleFonts.sourceSansPro(textStyle: kJobDesTextStyle),
          ),
          SizedBox(
            width: 90.0,
            height: 20.0,
            child: Divider(
              color: kTextColor[100],
            ),
          ),
          SizedBox(
            width: 170.0,
            height: 10.0,
            child: Divider(
              color: kTextColor[100],
            ),
          ),
          SizedBox(
            width: 90.0,
            height: 20.0,
            child: Divider(
              color: kTextColor[100],
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: kMainTextColor,
              ),
              title: Text(
                profile.phoneNumber,
                style: GoogleFonts.sourceSansPro(textStyle: kCardTextStyle),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: kMainTextColor,
              ),
              title: Text(
                profile.email,
                style: GoogleFonts.sourceSansPro(textStyle: kCardTextStyle),
              ),
            ),
          ),
          SizedBox(
            height: 70.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                child: Icon(
                  FontAwesomeIcons.instagram,
                  size: 40.0,
                  color: kIconColor,
                ),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 10.0,
              ),
              CircleAvatar(
                radius: 25.0,
                child: Icon(
                  FontAwesomeIcons.facebook,
                  size: 40.0,
                  color: kIconColor,
                ),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 10.0,
              ),
              CircleAvatar(
                radius: 25.0,
                child: Icon(
                  FontAwesomeIcons.whatsapp,
                  size: 40.0,
                  color: kIconColor,
                ),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(profile.name.toUpperCase()),
        backgroundColor: kAppBarColor,
      ),

    );
  }
}
