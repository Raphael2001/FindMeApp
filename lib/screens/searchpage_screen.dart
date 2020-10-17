import 'package:find_me/components/profile.dart';
import 'package:find_me/components/profile_list.dart';
import 'package:find_me/components/profile_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'package:find_me/components/profile_list.dart';

import 'add_profile_screen.dart';

class SearchPage extends StatelessWidget {
  List<Profile> list = ProfileList.profilelist;

  Future<List<Profile>> updateList() async {
    ProfileList p = ProfileList();
    return await p.profileStream();
  }

  @override
  Widget build(context) {
    return FutureBuilder<List<Profile>>(
        future: updateList(),
        builder: (context, AsyncSnapshot<List<Profile>> snapshot) {
          if (snapshot.hasData) {
            ProfileList.profilelist = snapshot.data;
            return HomePage();
          } else {
            return Dialog(
              child: new CircularProgressIndicator(),
            );
            // return CircularProgressIndicator();
          }
        });
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Profile> list = ProfileList.profilelist;

  String filterBy = '';

  Widget profileExisted() {
    bool isProfileExisted = false;
    Profile profile =  ProfileList.findProfile(
        Provider.of<FirebaseUser>(context, listen: false).email);
    if(profile!=null)
      {
        isProfileExisted = true;
      }
    else{isProfileExisted=false;}
    if (isProfileExisted) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: Text(
              "My Profile",
              style: kMyProfileTextStyle,
            ),
            padding: EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
          ),
          Card(
            child: ProfileTile(
              profile:profile,
            ),
          ),
        ],
      );
    } else {
      return GestureDetector(
        onTap: () {

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddProfileScreen(),
              ),
            ),
          );
        },
        child: Card(
          color: kCardBackgroundColor,
          elevation: 15.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            title: Center(
              child: Text('Add New Profile', style: kCardTextStyle),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(child: const Text('Find Me')),
      ),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: kTextFiledInputDecoration,
              style: TextStyle(
                color: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  filterBy = value.toLowerCase();
                  list = ProfileList.filter(filterBy);
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            profileExisted(),
            SizedBox(
              height: 20.0,
              child: Divider(
                color: kTextColor[100],
              ),
            ),
            Flexible(
              child: ProfileListViewer(
                profileList: list,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
