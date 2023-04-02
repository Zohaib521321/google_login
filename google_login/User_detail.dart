import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final FirebaseAuth _Auth=FirebaseAuth.instance;
final GoogleSignIn googleSignIn=GoogleSignIn();
var name;
var email;
var photourl;
Future Signinwithgoogle() async{

final GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();
final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount!.authentication;
final AuthCredential credential = GoogleAuthProvider.credential(
  accessToken: googleSignInAuthentication.accessToken,
  idToken: googleSignInAuthentication.idToken,);

final  authResult= await _Auth.signInWithCredential(credential);
final   user= authResult.user;
final currentuser=await _Auth.currentUser;
if (user!=null && currentuser!=null) {
  assert (user.email!=null);
  assert(user.displayName !=null);
  assert(user.photoURL !=null);
  assert(user.uid==currentuser.uid);
  name=user.displayName;
  email=user.email;
  photourl=user.photoURL;
  return "Signed in with google succeed $name";

}



}


  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
