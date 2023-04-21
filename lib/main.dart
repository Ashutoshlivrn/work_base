import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:work_base/AboutAppPage/AboutAppPage.dart';
import 'package:work_base/ChooseYourProfile/ChooseYourProfile.dart';
import 'package:work_base/EmployeeInCompany/employeeincompany.dart';
import 'package:work_base/ProductManager/ProductManager.dart';
import 'package:work_base/ROugh/getdataprovider.dart';
import 'package:work_base/ROugh/gettingJson.dart';
import 'package:work_base/SignIn.UpPage/SignInPage.dart';
import 'package:work_base/SignIn.UpPage/SignUpPage.dart';
import 'package:work_base/SplashScreen/SplashScreen.dart';
import 'package:work_base/ROugh/sliver.dart';
import 'package:work_base/StreamsPage/StreamsPage.dart';
import 'package:work_base/callingjsondata.dart';
import 'UserProfile/UserProfile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
         return MultiProvider(
             providers: [
               ChangeNotifierProvider(create: (_)=>getthedata() ),
               ChangeNotifierProvider(create: (_)=> GoogleSignInProvider() )
             ],
           child:
           const MaterialApp(
               debugShowCheckedModeBanner: false,
               themeMode: ThemeMode.system,
               //  home: EmployeeinCompany()
               // home:  AboutApppage(),
              // home: ProductManager(),
               //home: Userprofile(),
               // home: ChooseYourProfile(),
               //  home: Streamspage(),
               // home:  SignUpPage(),
              // home: jsonres()
            // home: CallingJson(),

               home: Splashscreen()

    ),

         );


  }
}
