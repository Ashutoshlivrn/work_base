import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:work_base/ProductManager/ProductManager.dart';
import 'package:firebase_core/firebase_core.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('this is homescreen'),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Text( ' this is logout button'),
            IconButton(onPressed: (){
            GoogleSignInProvider().signout();
            }, icon: Icon(Icons.add)),
            SizedBox(height: 30,),
            Text(FirebaseAuth.instance.currentUser!.displayName!.toString()),
            SizedBox(height: 30,),
            Text(FirebaseAuth.instance.currentUser!.email!.toString()),
            SizedBox(height: 30,),
            Text(FirebaseAuth.instance.currentUser!.phoneNumber!.toString()),

          ],
        ),
      ),
    );
  }
}
