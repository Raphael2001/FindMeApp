import 'package:flutter/material.dart';
import 'package:find_me/components/profile.dart';
import 'package:find_me/constants.dart';
import 'package:find_me/screens/card_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:find_me/components/reusable_card.dart';

class ProfileTile extends StatelessWidget {
  final Profile profile;

  ProfileTile({this.profile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: profile.photo != null
          ? CircleAvatar(
        backgroundImage: Image
            .network(profile.photo)
            .image,
        backgroundColor: Colors.transparent,
      )
          : Icon(
        Icons.person,
        color: kIconColor,
      ),
      title: Text(
        '${profile.name}',
        style: GoogleFonts.specialElite(textStyle: kTileTextStyle),
      ),
      subtitle: Text(
        ' ${profile.jobDes}',
        style: GoogleFonts.specialElite(textStyle: kJobDesTileTextStyle),
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
