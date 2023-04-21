import 'package:flutter/material.dart';
import 'package:work_base/ROugh/custom_clipper.dart';
enum SampleItem { itemOne, itemTwo, itemThree }

class topbar extends StatelessWidget {
  const topbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SampleItem? selectedMenu;
    return  SafeArea(child:
     SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
            PopupMenuButton<SampleItem>(
              color: Colors.white38,
              elevation: 10,
              icon: Icon(Icons.menu),
              initialValue: selectedMenu,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                 PopupMenuItem<SampleItem>(
                  value: SampleItem.itemOne,
                  child: InkWell(child: Text('Log Out'),
                    onTap: (){}
                  ),
                ),
                 PopupMenuItem<SampleItem>(
                  value: SampleItem.itemTwo,
                  child: InkWell(child: Text('Edit'),
                      onTap: (){}
                  ),
                ),
                 PopupMenuItem<SampleItem>(
                  value: SampleItem.itemThree,
                   child: InkWell(child: Text('Contact'),
                       onTap: (){}
                   ),
                ),
              ],
            ),

        ],
      ),
    )

    );
  }

}

class UserDescrip extends StatelessWidget {
  const UserDescrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(backgroundColor: Colors.white,radius: 52,child: CircleAvatar(backgroundColor: Colors.blue,radius: 50,),),
          SizedBox(height: 15,),
          Text('Name'),
          Text('Email')
        ],
      ) ,
    );
  }
}


class Clippath extends StatelessWidget {
  const Clippath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(

      clipper: customClipper(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
               fit: BoxFit.fitHeight,
              image: AssetImage('Images/drop.jpg'),
             // image: NetworkImage('https://cdn.pixabay.com/photo/2020/04/29/13/36/abstract-5108925_960_720.jpg'),
            filterQuality: FilterQuality.high,
          ),
        ),
        height: 270,

      ),
    );
  }
}
