import 'dart:async';

import 'package:flutter/material.dart';
import 'package:work_base/AboutAppPage/AboutAppPage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
    Duration(seconds: 3),
          () {
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> AboutApppage()  ));
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            CircleAvatar(
                backgroundImage: AssetImage('Images/workbase.png'),
              radius: 120,
            ),
            SizedBox(height: 250,),
            CircularProgressIndicator(color: Colors.black),
          ],
        ),
      ),

    );
  }
}
