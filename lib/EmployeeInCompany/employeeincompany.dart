

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:work_base/ProductManager/ProductManager.dart';
import 'package:work_base/UserProfile/UserProfile.dart';

class EmployeeinCompany extends StatefulWidget {
  const EmployeeinCompany({Key? key}) : super(key: key);

  @override
  State<EmployeeinCompany> createState() => _EmployeeinCompanyState();
}

class _EmployeeinCompanyState extends State<EmployeeinCompany> {
  String imageUrl = '';
  int _selectedIndex = 1;
  final List<Widget> _widgetOptions = <Widget>[
  container(),
  container(),
  container(),
  container(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: Scaffold.of(context).openDrawer,
              icon: Icon(Icons.menu_rounded),
            );
          }),
          backgroundColor: Colors.black87,
          elevation: 0.5,
          title: Center(child: Text('Employee')),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Contact HR'),
                        content: Text(' would you call her?'),
                        actions: [
                          ElevatedButton(onPressed: () {}, child: Text('yes')),
                          ElevatedButton(onPressed: () {}, child: Text('no')),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.radio_button_on)),
          ],
        ),
        drawer: Drawer(

            //shape: CircleBorder(side: BorderSide(width: 10)),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.zero,
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                borderSide: BorderSide.none),
            width: 240,
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('Images/mountain.jpg'))),
                  currentAccountPicture: Stack(children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundImage: AssetImage('Images/drop.jpg'),
                    ),
                    Positioned(
                      top: 38,
                      left: 38,
                      child: IconButton(
                          onPressed: () async {
                            ImagePicker imagePicker = ImagePicker();
                            XFile? file = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            print('aaaaaaaaaaaaaaaaa ${file?.path}');
                            if (file == null) return;

                            String uniqueNameFile =
                                DateTime.now().millisecondsSinceEpoch.toString();

                            Reference referenceRoot =
                                FirebaseStorage.instance.ref();
                            Reference referenceDirImages =
                                referenceRoot.child('images');
                            Reference referenceImageToUpload =
                                referenceDirImages.child(uniqueNameFile);

                            try {
                              await referenceImageToUpload
                                  .putFile(File(file!.path));
                              imageUrl =
                                  await referenceImageToUpload.getDownloadURL();
                            } catch (error) {}
                          },
                          icon: Icon(Icons.camera)),
                    )
                  ]),
                  accountName: Text(
                    'name',
                    style: TextStyle(color: Colors.grey[250]),
                  ),
                  accountEmail:
                      Text('email', style: TextStyle(color: Colors.white70)),
                  onDetailsPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('login with a different id'),
                          actions: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_box_rounded))
                          ],
                        );
                      },
                    );
                  },
                  arrowColor: Colors.white70,
                ),
                SizedBox(height: 1),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Userprofile()  ));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Text('A'),
                    radius: 15,
                  ),
                  title: Text(' Account ', style: TextStyle(color: Colors.black)),
                ),
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text('O', style: TextStyle(color: Colors.black)),
                    radius: 15,
                  ),
                  title: Text(' Orders ', style: TextStyle(color: Colors.black)),
                ),
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      'C',
                      style: TextStyle(color: Colors.black),
                    ),
                    radius: 15,
                  ),
                  title: Text(' Connect ', style: TextStyle(color: Colors.black)),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    GoogleSignInProvider().signout();
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightGreen,
                    child: Text('L', style: TextStyle(color: Colors.black)),
                    radius: 15,
                  ),
                  title: Text(' LogOut ', style: TextStyle(color: Colors.black)),
                ),
              ],
            )),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: const[
                    GButton(
                      icon: LineIcons.diceOne,
                      text: 'Client',
                    ),
                    GButton(
                      icon: LineIcons.diceTwo,
                      text: 'Client',
                    ),
                    GButton(
                      icon: LineIcons.diceThree,
                      text: 'Client',
                    ),
                    GButton(
                      icon: LineIcons.diceFour,
                      text: 'Client',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          )
      ),
    );
  }
}

Widget container(){
     return GestureDetector(
       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      //  onVerticalDragEnd: (DragEndDetails details) => FocusManager.instance.primaryFocus?.unfocus(),
       child: Builder(builder: (context) => Container(
         height:  MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         child: Column(
           children: [
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Container(
               height: 120 ,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(10)) ,
                 gradient: LinearGradient(
                   colors: [
                     Colors.deepOrangeAccent,
                     Colors.orange,
                     Colors.orangeAccent,
                   ],
                   begin: Alignment.topLeft ,
                   end: Alignment.bottomCenter ,
                 ) ,

               ),
               child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 15,),
                   Text('  Number of Units Completed',style: TextStyle(
                     color: Colors.black,
                     fontSize: 23,
                     fontWeight: FontWeight.w500
                   ),),
                   SizedBox(height: 20,),
                   Row(

                     children: [
                       SizedBox(width: 10,),
                       Container(
                         height : 30 ,
                         width: 155,
                         child: TextField(
                              maxLines: 1,
                              cursorColor: Colors.black,
                              
                         ),
                       ),
                       SizedBox(width: 20,),
                       ElevatedButton(onPressed: (){}, child: Text('Edit'),
                         style: ButtonStyle(
                             elevation: MaterialStatePropertyAll(3) , backgroundColor: MaterialStatePropertyAll(Colors.black) ),),
                       SizedBox(width: 16,),
                       ElevatedButton(onPressed: (){}, child: Text('Save'),
                         style: ButtonStyle(
                             elevation: MaterialStatePropertyAll(3) , backgroundColor: MaterialStatePropertyAll(Colors.black) ),)
                     ],
                   )
                 ],
               ),
             ),
           ),
           ],
         ),
       ),),
     );
  // return Container(
  //   height: MediaQuery.of(BuildContext context).size.height,
  //   width: MediaQuery.of(BuildContext context).size.width,
  //   child: Column(
  //     children: [
  //
  //     ],
  //   ),
  // );
   // return Container(
   //   height: 200,
   //   width: 200,
   //   decoration: BoxDecoration(
   //     gradient: LinearGradient(
   //       colors: [
   //         Colors.indigo,
   //         Colors.blueAccent,
   //         Colors.lightBlue
   //       ],
   //       begin: Alignment.topCenter,
   //       end:  Alignment.bottomCenter,
   //     )
   //   ),
   // );
}