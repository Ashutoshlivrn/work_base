import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_base/EmployeeInCompany/employeeincompany.dart';
import 'package:work_base/StreamsPage/StreamsPage.dart';
import 'package:work_base/UserProfile/UserProfile.dart';
import 'package:work_base/loginpage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductManager extends StatefulWidget {
  ProductManager({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  State<ProductManager> createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  String imageUrl = ' ';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

                            String uniqueNameFile = DateTime.now().millisecondsSinceEpoch.toString();

                            Reference referenceRoot = FirebaseStorage.instance.ref();
                            Reference referenceDirImages = referenceRoot.child('images');
                            Reference referenceImageToUpload = referenceDirImages.child(uniqueNameFile);

                            try {
                              await referenceImageToUpload.putFile(File(file!.path));
                              imageUrl =  await referenceImageToUpload.getDownloadURL();
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Userprofile()));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Text('A'),
                    radius: 15,
                  ),
                  title:
                      Text(' Account ', style: TextStyle(color: Colors.black)),
                ),
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text('O', style: TextStyle(color: Colors.black)),
                    radius: 15,
                  ),
                  title:
                      Text(' Orders ', style: TextStyle(color: Colors.black)),
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
                  title:
                      Text(' Connect ', style: TextStyle(color: Colors.black)),
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
                  title:
                      Text(' LogOut ', style: TextStyle(color: Colors.black)),
                ),
              ],
            )),
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
          title: Center(child: Text('Product manager')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 2, color: Colors.black54)),
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                        height: 130,
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 30,
                            ),
                            Text(
                              'rashmi',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          ],
                        )),
                    SizedBox(
                        height: 130,
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 30,
                            ),
                            Text(
                              'ashutosh',
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                            )
                          ],
                        )),
                    SizedBox(
                        height: 130,
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 30,
                            ),
                            Text(
                              "Aman",
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                            )
                          ],
                        )),
                    SizedBox(
                        height: 130,
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 30,
                            ),
                            Text(
                              'Akash',
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                            )
                          ],
                        )),
                    SizedBox(
                        height: 130,
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 30,
                            ),
                            Text(
                              'Mahesh',
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                            )
                          ],
                        )),
                    SizedBox(
                        height: 130,
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 30,
                            ),
                            Text(
                              'Ashish',
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                            )
                          ],
                        )),
                    SizedBox(
                        height: 130,
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 30,
                            ),
                            Text(
                              'Pikachu',
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                            )
                          ],
                        )),
                    SizedBox(
                        height: 130,
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 30,
                            ),
                            Text(
                              'ashutosh',
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                            )
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EmployeeinCompany()  ));
              }, child:  Text('go to employees page'))
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.black38,
              //     borderRadius: BorderRadius.all(Radius.circular(6)),
              //   ),
              //   padding: EdgeInsets.all(15),
              //     height: 400,
              //     width: 400,
              //     child: gridDB()),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget gridDB() {
//   return GridView.builder(
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, mainAxisSpacing: 14, crossAxisSpacing: 14),
//     itemBuilder: (context, index) {
//       return Container(
//         height: 60,
//         width: 60,
//         color: Colors.orange,
//       );
//     },
//   );
// }

class GoogleSignInProvider extends ChangeNotifier {
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signout() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
