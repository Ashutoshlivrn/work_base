import 'package:flutter/material.dart';
import 'package:work_base/ProductManager/ProductManager.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('this is login page'),),
      body: Center(
        child: Column(
          children: [
              Text('this is login button'),
              IconButton(onPressed: (){
                 GoogleSignInProvider().signInWithGoogle().google;
              }, icon: Icon(Icons.account_box))
          ],
        ),
      ),
    );
  }
}
