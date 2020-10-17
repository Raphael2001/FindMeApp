import 'package:cloud_firestore/cloud_firestore.dart';

class Profile{
  String name;
  String jobDes;
  String phoneNumber;
  String email;
  String photo;

  Profile({this.name, this.jobDes, this.phoneNumber, this.email, this.photo});

  void save(){
    // todo: need to connect to firebase
  //  ProfileList.profilelist.add(this);
    final _firestore = Firestore.instance;

    _firestore.collection('profiles').add({
      'name':this.name,
      'jobDescription': this.jobDes,
      'phoneNumber': this.phoneNumber,
      'email':this.email,
      'pic': this.photo,
    });
  }
}