import 'package:find_me/components/profile.dart';
import 'package:find_me/components/profile_tile.dart';
import 'package:find_me/screens/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    this.profile,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          buildExpCont(profile: profile),
        ],
      ),
    );
  }

  Expanded buildExpCont({@required Profile profile}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        height: 400,
        width: 30,
        child: ProfileCard(
          profile: profile,
        ),
        margin: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0), color: Colors.white),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Profile profile;

  ProfileCard({this.profile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.transparent,
              backgroundImage: profile.photo != null
                  ? Image.network(profile.photo).image
                  : Icon(
                      Icons.person,
                      color: kIconColor,
                    ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '${profile.name}',
              style: GoogleFonts.specialElite(textStyle: kTileTextStyle),
            ),
            Text(
              ' ${profile.jobDes}',
              style: GoogleFonts.specialElite(textStyle: kJobDesTileTextStyle),
            ),

            //            Container(
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: Image.network(profile.photo).image,
//                   fit: BoxFit.fill,
//                ),
//                color: Colors.transparent,
//              ),
//            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return CardScreen(
              profile: profile,
            );
          }),
        );
      },
    );
  }
}
