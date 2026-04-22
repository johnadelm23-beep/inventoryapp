

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {

 static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

 static  Future<bool> register({required String email, required String password, required String name,required String confirmPassword})async{
    try{
      if (password != confirmPassword) {
        throw Exception("Passwords do not match");
      }

      final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,

      );
       addUsers(name: name, email: email,
       uid: response.user?.uid??"",
       );
      print(response.user?.uid);
     return true;


    }on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

    return false;

    }


    catch(e){
      return false;

    }

  }

 static  Future<bool> login({required String email, required String password, })async{
   try{


     final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: email,
       password: password,

     );
     print(response.user?.uid);
     return true;


   }on FirebaseAuthException catch(e){
     if (e.code == 'weak-password') {
       print('The password provided is too weak.');
     } else if (e.code == 'email-already-in-use') {
       print('The account already exists for that email.');
     }

     return false;

   }


   catch(e){
     return false;

   }

 }

static Future addUsers({required String name,required String email,required String uid})async{
   try{
   await  FirebaseFirestore.instance.collection("users").doc(uid).set({

       "name":name,
       "email":email,

     });
     
     
     
   }
   catch(e){}
 


 }

static Future<bool> signInWithGoogle() async {
   // Trigger the authentication flow
   try{
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

     // Obtain the auth details from the request
     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

     // Create a new credential
     final credential = GoogleAuthProvider.credential(
       accessToken: googleAuth?.accessToken,
       idToken: googleAuth?.idToken,
     );

     // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

     return true;
   }catch(e){
     return false;
   }
 }













}