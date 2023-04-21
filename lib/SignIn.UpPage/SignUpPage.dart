import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_base/ProductManager/ProductManager.dart';
import 'package:work_base/StreamsPage/StreamsPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('Images/signupimage.png')),
              ),
            ),
            SizedBox(height: 20,),
            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    hintText: '+91 7347204748'),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ProductManager()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            //TextButton('New User? Create Account')
            TextButton(onPressed: () async{
               await GoogleSignInProvider().signInWithGoogle();
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=> ProductManager() ));
            }, child: Text('Sign Up with Google?'))
          ],
        ),
      ),
    );
  }
}

// Column(
// children: [
// SizedBox(height: 100,),
// IconButton(onPressed: (){
// print('ashutsdffsdffsdfsdfsdfsdfs');
// Auth().DeleteUser();
// }, icon: Icon(Icons.abc)),
//
// SizedBox(height: 30,),
// IconButton(onPressed: (){
// print('akhissssssssssssssssssssssssssssssssssssssssssssssl');
// myname().signInWithGoogle();
// }, icon: Icon(Icons.add))
// ],
// ),
// class SignInPage extends StatefulWidget {
//   const SignInPage({Key? key}) : super(key: key);
//
//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin{
//   late AnimationController controller1 ;
//   late AnimationController controller2 ;
//   late Animation<double> animation1;
//   late Animation<double> animation2;
//   late Animation<double> animation3;
//   late Animation<double> animation4;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller1 = AnimationController(vsync: this,
//     duration: Duration(seconds: 5));
//     animation1 = Tween<double>(begin: .1,end: .15).animate(CurvedAnimation(parent: controller1, curve: Curves.easeInOut)
//       ..addListener(() {setState(() {
//
//       }); })..addStatusListener((status) {
//         if(status ==AnimationStatus.completed) {
//           controller1.reverse();
//         }
//         else if(status == AnimationStatus.dismissed){
//           controller1.forward();
//         }
//       })
//     );
//
//
//   }
// }
