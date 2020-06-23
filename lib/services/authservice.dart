//import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shoppingapp2/models/appuser.dart';

//const String NoSuchUser = 'No such User';

enum Errors {
  No_Such_User,
  Invalid_Email_Format,
  Invalid_Email_Or_Password,
}

class AuthService extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AppUser appuser;
  var errorMsg;

  AppUser _userFromFirebase(FirebaseUser user) {
    if (user != null) {
      AppUser appuser = AppUser(uid: user.uid);

      getUsersData(appuser);
      //getFavourites(appuser);
      return appuser;
    } else {
      return null;
    }
    //return user != null ? AppUser(uid: user.uid) : null;
    // return AppUser();
  }

  Future<AppUser> mySignIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print('result from authservice: $result');
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } on PlatformException catch (err) {
      getAuthError(err.message);
      return Future.value(null);
    } catch (e) {
      return Future.value(null);
    }
  }

  Stream<AppUser> get user {
    return _auth.onAuthStateChanged.map((user) => _userFromFirebase(user));
    //return _auth.currentUser().then((user) => _userFromFirebase(user)).asStream();
  }

  Future<void> getAuthError(String msg) async {
    errorMsg = await msg;
  }

  Future<String> getError() async {
    //print(errorMsg);
    if (errorMsg.contains(
        'There is no user record corresponding to this identifier. The user may have been deleted')) {
      errorMsg = 'No such User';
      //errorMsg = Errors.No_Such_User.toString();
    } else if (errorMsg.contains('The email address is badly formatted')) {
      errorMsg = 'Please provide valid email address';
      //errorMsg = Errors.Invalid_Email_Format;
    } else if (errorMsg.contains(
        'The password is invalid or the user does not have a password')) {
      errorMsg = 'Invalid email id or password';
      //errorMsg = Errors.Invalid_Email_Or_Password.toString();
    }

    return errorMsg;
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      notifyListeners();
      //return result;
    } catch (e) {
      print(e.toString());
      //return null;
    }
  }

    void uploadUserCart(String uid, String name, String description, String price,
      String discount, String quantity, String image) async {
    try {
      await Firestore.instance.collection('user_cart').document().setData({
        'id': uid,
        'name': name,
        'description': description,
        'price': price,
        'discount': discount,
        'quantity': quantity,
        //'docId': docId,
        'image': image,
        'createdAt': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e.toString());
    }
  }

  getUsersData(AppUser user) {
    Firestore.instance
        .collection('users')
        .where('id', isEqualTo: '${user.uid}')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((element) {
        //print(element.data['username']);
        user.username = element.data['username'];
      });
    });
  }

  void firestoreAction(bool isFav, String docId, String uid, String name,
      String description, String price, String discount, String image) async {
    if (isFav) {
      await uploadUserFavourites(
          uid, name, description, price, discount, image);
    } else {
      await deleteUserFavourites(docId);
    }
  }

  void uploadUserFavourites(String uid, String name, String description,
      String price, String discount, String image) async {
    try {
      await Firestore.instance
          .collection('user_favourites')
          .document()
          .setData({
        'id': uid,
        'name': name,
        'description': description,
        'price': price,
        'discount': discount,
        'image': image,
        'createdAt': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteUserFavourites(String docId) async {
    await Firestore.instance
        .collection('user_favourites')
        .document(docId)
        .delete();
  }




}
