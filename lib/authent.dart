import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmythra2/model/user_model.dart';
import 'package:dmythra2/model/sponsor_model.dart';
import 'package:dmythra2/user_forgetpassword.dart';
import 'package:dmythra2/userhome.dart';
import 'package:dmythra2/userlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dmythra2/model/user_post_model.dart';

class BackendServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//------------------user------------------------------
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  Future<void> saveUser(
    String userID,
    String udid,
    String username,
    String disability,
    String dob,
    String email,
    int aadhar,
  ) async {
    _userModel = UserModel(
      userid: userID,
      udid: udid,
      username: username,
      disability: disability,
      dob: dob,
      email: email,
      aadhar: aadhar,
    );

    await firebaseFirestore
        .collection('users')
        .doc(userID)
        .set(_userModel!.toMap());
  }

  Future<void> signup(
    emailAddress,
    password,
    String udid,
    String username,
    String disability,
    String dob,
    int aadhar,
  ) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final user = firebaseAuth.currentUser;
      user!.sendEmailVerification();
      saveUser(
        firebaseAuth.currentUser!.uid,
        udid,
        username,
        disability,
        dob,
        emailAddress,
        aadhar,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> userLogin(
    String userEmail,
    String userPassword,
    context,
    String collectionName,
    pageName,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      final user = firebaseAuth.currentUser;
      final emailVerified = user!.emailVerified;
      print('Verification: $emailVerified');

      if (emailVerified == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("please verify email")));
      } else {
        CollectionReference collection =
            firebaseFirestore.collection(collectionName);
        var userQuery = await collection.doc(user.uid).get();
        if (userQuery.exists) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => pageName,
              ),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('This email is not registered')));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  String? _uid;
  String get uid => _uid!;

  Future fetchUserData() async {
    try {
      print('Fethcing data _________');
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        _userModel = UserModel(
          userid: snapshot['userid'],
          udid: snapshot['udid'],
          username: snapshot['username'],
          disability: snapshot['disability'],
          dob: snapshot['dob'],
          email: snapshot['email'],
          aadhar: snapshot['aadhar'],
        );
        _uid = userModel.userid;
        print('Fethcing completed _________');
      });
    } catch (e) {
      print('Fetching user failed : $e');
    }
  }

  //------------------sponsor------------------------------------

  SponsorModel? _sponsorModel;
  SponsorModel get sponsorModel => _sponsorModel!;
  Future<void> saveSponsor(
    String sponsorID,
    String sponsorName,
    String dob,
    String email,
    int aadhar,
  ) async {
    _sponsorModel = SponsorModel(
      sponsorid: sponsorID,
      sponsorname: sponsorName,
      dob: dob,
      email: email,
      aadhar: aadhar,
    );

    await firebaseFirestore
        .collection('sponsors')
        .doc(sponsorID)
        .set(_sponsorModel!.toMap());
  }

  Future sponsorSignUp(
    emailAddress,
    password,
    String sponsorname,
    String dob,
    int aadhar,
  ) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final user = firebaseAuth.currentUser;
      user!.sendEmailVerification();
      saveSponsor(
        firebaseAuth.currentUser!.uid,
        sponsorname,
        dob,
        emailAddress,
        aadhar,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendPasswordResetEmail(String email, context) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Password reset email sent successfully. Check your inbox.')));

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const UserLogin(),
      ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } catch (e) {
      print(e);
    }
  }

  //-------------------------Activity(post)------------------------------------

  PostModel? _postModel;
  PostModel get postModel => _postModel!;

  Future<String> storeImagetoStorge(String ref, File file) async {
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask =
        firebaseStorage.ref().child(ref).putFile(file, metadata);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    log(downloadURL);
    return downloadURL;
  }

  File? postPic;

  Future<File> pickPostPhoto(context) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        postPic = File(pickedImage.path);
      }
    } catch (e) {
      print(e);
    }
    return postPic!;
  }

  Future<void> selectPostPic(context) async {
    postPic = await pickPostPhoto(context);
  }

  uploadPostPhoto(File postPhoto,String postName) async {
    await storeImagetoStorge(
            'Users posts/${firebaseAuth.currentUser!.uid}/Post pics/$postName/',
            postPhoto)
        .then((value) async {
      postModel.postPic = value;

      DocumentReference docRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('posts')
          .doc(postModel.postid);
     await docRef.update({'postPic': value});
     
     DocumentReference publicDocRef = firebaseFirestore.collection('users posts').doc(postModel.postid);
    await publicDocRef.update({'postPic': value});
    });
    _postModel = postModel;
    print('Pic uploaded successfully');
  }

  Future<void> savePost(
    String postPic,
    String postBio,
  ) async {
    final docID = firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid);
     final userDocID =   docID.collection('posts')
        .doc(docID.id);
    final postsDocId = firebaseFirestore.collection('users posts').doc(docID.id);
    _postModel = PostModel(
      postid: docID.id,
        postPic: postPic,
        postBio: postBio,
        userid: firebaseAuth.currentUser!.uid);


  await  userDocID.set(_postModel!.toMap(docID.id));

   await postsDocId.set(_postModel!.toMap(postsDocId.id));
  }
}
