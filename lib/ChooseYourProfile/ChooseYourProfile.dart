import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:work_base/EmployeeInCompany/employeeincompany.dart';
import 'package:work_base/SignIn.UpPage/SignInPage.dart';

class ChooseYourProfile extends StatelessWidget {
  const ChooseYourProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20,0,0,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              textDirection: TextDirection.ltr,
              children: [
                SizedBox(height: 100,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text('Hi Welcome to WorkBase',
                    style: TextStyle(fontWeight: FontWeight.w400,letterSpacing: 1, fontSize: 26,color: Colors.black),),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DefaultTextStyle(
                    style: TextStyle(letterSpacing: .5,fontSize: 20,wordSpacing: 2,color: Colors.black),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Please select your profession',speed: Duration(milliseconds: 110 )),
                      ],
                      isRepeatingAnimation: false,
                    ),
                  ),),
              ],
            )
          ),
          SizedBox(height: 90,),
          Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:  (context )=> SignInPage()  ));
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 1, color: Colors.black)

                  ),
             elevation: 10,
             color: Colors.teal,
             child: Container(
                 height: 70,
                 child: Center(
                   child: Text('Product  Manager',style: TextStyle(fontSize: 22,letterSpacing: 4 ),),
                 ),
             ),
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:  (context )=> EmployeeinCompany()  ));
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  shape: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color: Colors.black)

                  ),
                  elevation: 10,
                  color: Colors.teal,
                  child: Container(
                    height: 70,
                    child: Center(
                      child: Text('Employee',style: TextStyle(fontSize: 22,letterSpacing: 4 ),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Builder(builder: (context) {
                   return AlertDialog(
                      title: Text('Yet to Complete',style: TextStyle(fontWeight: FontWeight.w500),),
                    );
                  }, );
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color: Colors.black)

                  ),
                  elevation: 10,
                  color: Colors.teal,
                  child: Container(
                    height: 70,
                    child: Center(
                      child: Text('HR',style: TextStyle(fontSize: 22,letterSpacing: 4 ),),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
