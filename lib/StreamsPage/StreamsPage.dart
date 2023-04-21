import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_base/ProductManager/ProductManager.dart';
import 'package:work_base/SignIn.UpPage/SignUpPage.dart';

import 'package:work_base/SplashScreen/SplashScreen.dart';
import 'package:work_base/loginpage.dart';

import '../homescree.dart';

class Streamspage extends StatefulWidget {
  const Streamspage({Key? key}) : super(key: key);

  @override
  State<Streamspage> createState() => _StreamspageState();
}

class _StreamspageState extends State<Streamspage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().currentuser ,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ProductManager();
          }
          else {
            return Splashscreen();
          }
        },);


  }
}


class Auth {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   User? get currentUser => firebaseAuth.currentUser ;
   Stream<User?> get currentuser{
     return firebaseAuth.authStateChanges();
   }

  Future<void> SignIn( String Email, String Password) async{
     await firebaseAuth.signInWithEmailAndPassword(email: Email, password: Password);
  }
  Future<void> SignUp(String Email, String Password) async {
    await firebaseAuth.createUserWithEmailAndPassword(email: Email, password: Password);
  }
  Future<void> SignOut() async{
    await firebaseAuth.signOut();
 }
  Future<void> DeleteUser() async{
   await firebaseAuth.currentUser?.delete();
 }
}