import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:find_me/components/profile.dart';
import 'package:find_me/components/profile_tile.dart';
import 'package:find_me/components/reusable_card.dart';

final _firestore = Firestore.instance;

class ProfileList {
  static List<Profile> profilelist = [];

  static List<Profile> filter(String filterBy) {
    List<Profile> list = [];
    for (int i = 0; i < ProfileList.profilelist.length; i++) {
      Profile pro = ProfileList.profilelist[i];
      if (pro.name.toLowerCase().startsWith(filterBy)) {
        list.add(pro);
      }
    }
    return list;
  }

  static Profile findProfile(String filterBy) {
    for (int i = 0; i < ProfileList.profilelist.length; i++) {
      Profile pro = ProfileList.profilelist[i];
      if (pro.email.toLowerCase() == filterBy.toLowerCase()) {
        return pro;
      }
    }
    return null;
  }

  Future<List<Profile>> getProfiles() async {
    final profiles = await _firestore.collection('profiles').getDocuments();

    List<Profile> list = [];
    for (var profile in profiles.documents) {
      Profile pro = Profile();
      pro.name = profile.data['name'];
      pro.email = profile.data['email'];
      pro.jobDes = profile.data['jobDescription'];
      pro.phoneNumber = profile.data['phoneNumber'];
      pro.photo = profile.data['pic'];

      list.add(pro);
    }
    return list;
  }

  Future<List<Profile>> profileStream() async {
    List<Profile> list = [];

    await for (var snapshot
        in _firestore.collection('profiles').orderBy('name').snapshots()) {
      for (var profile in snapshot.documents) {
        Profile pro = Profile();
        pro.name = profile.data['name'];
        pro.email = profile.data['email'];
        pro.jobDes = profile.data['jobDescription'];
        pro.phoneNumber = profile.data['phoneNumber'];
        pro.photo = profile.data['pic'];

          list.add(pro);

      }

      return list;
    }
  }
}

class ProfileListViewer extends StatelessWidget {
  String filterBy;
  List<Profile> profileList = [];

  //ProfileListViewer({this.filterBy});

  ProfileListViewer({this.profileList});

//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//      scrollDirection: Axis.vertical,
//      shrinkWrap: true,
//      itemExtent: 100.0,
//      itemCount: profileList.length,
//      itemBuilder: (context, index) {
//        final profile1 = profileList[index];
//        index ++;
//        final profile2 = profileList[index ];
//        return ReusableCard(
//          profile1: profile1,
//          profile2: profile2,
//        );
//      },
//    );
//  }


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(profileList.length, (index) {
        final profile = profileList[index];
        return ReusableCard(
          profile: profile,
        );
      }),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: _firestore.collection('profiles').orderBy('name').snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return Center(
//            child: CircularProgressIndicator(
//              backgroundColor: Colors.teal,
//            ),
//          );
//        }
//        final profiles = snapshot.data.documents;
//        List<Card> list = [];
//        for (var profile in profiles) {
//          ProfileTile _tile;
//          Profile pro = Profile();
//          pro.name = profile.data['name'];
//          pro.email = profile.data['email'];
//          pro.jobDes = profile.data['jobDescription'];
//          pro.phoneNumber = profile.data['phoneNumber'];
//          pro.photo = profile.data['pic'];
//          if (pro.name.toLowerCase().startsWith(filterBy)) {
//            _tile = ProfileTile(
//              profile: pro,
//            );
//
//            list.add(Card(
//              child: _tile,
//            ));
//          }
//        }
//        return ListView(
//          children: list,
//        );
//      },
//    );
//  }
}
