import 'dart:io';

import 'package:find_me/components/profile_list.dart';
import 'package:find_me/screens/searchpage_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:find_me/components/profile.dart';
import 'package:find_me/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddProfileScreen extends StatefulWidget {
  @override
  _AddProfileScreenState createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  File _image;
  Profile profile = Profile();
  String downloadUrl;
  bool showSpinner = false;
  ImagePicker _picker;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        _image = image;
        print(_image.path);
      });
    }

    Future uploadPic(BuildContext bContext) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask =
          firebaseStorageRef.putFile(File(_image.path));
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      downloadUrl = await taskSnapshot.ref.getDownloadURL();
      setState(() {
        print('Profile Picture uploaded');
        profile.photo = downloadUrl;
        print(profile.photo);
      });
    }

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Container(
        color: kBackgroundColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add profile',
                textAlign: TextAlign.center,
                style: kTextStyle,
              ),
              buildSizedBox(),
              buildSizedBox(),
              TextField(
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Your Name'),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  profile.name = value;
                },
              ),
              buildSizedBox(),
              TextField(
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Your Job Description'),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  profile.jobDes = value;
                },
              ),
              buildSizedBox(),
              TextField(
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Your Phone Number'),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  profile.phoneNumber = value;
                },
              ),
              buildSizedBox(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(
                    'Profile Image',
                    style: kTextStyle2,
                  ),
                  SizedBox(
                    width: 110.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (_image != null)
                                  ? Image.file(
                                      File(_image.path),
                                      fit: BoxFit.fill,
                                    )
                                  : Icon(
                                      FontAwesomeIcons.camera,
                                      color: kIconColor,
                                    )),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Material(
                  elevation: 10.0,
                  color: kButtonBackgroundColor,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner=true;
                      });
                      profile.email =
                          Provider.of<FirebaseUser>(context, listen: false)
                              .email;
                      await uploadPic(context);
                      profile.save();
                      Navigator.pop(context);
                      SearchPage s = SearchPage();
                      s.build(context);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Add',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      height: 6.0,
    );
  }
}


