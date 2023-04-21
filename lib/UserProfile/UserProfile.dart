import 'package:flutter/material.dart';
import 'package:work_base/ROugh/custom_clipper.dart';
import 'package:work_base/ROugh/topbar.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({Key? key}) : super(key: key);

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2.13,
                child: Stack(
                 children: [
                   Clippath(),
                   topbar(),
                   Positioned(
                       height: MediaQuery.of(context).size.height/1.45,
                       width: MediaQuery.of(context).size.width,
                       child: UserDescrip()),
                 ],
                ),
              ),
              Container(
                child: Column(
                  children:  [
                    Card(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      elevation: 2 ,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(9),
                        selected: false,
                        leading:
                        Transform.translate(
                            offset: Offset(14, 6),
                            child: Icon(Icons.date_range_rounded,size: 30,color: Colors.blueGrey,),
                        ),
                        //Icon(Icons.join_inner_rounded,color: Colors.cyan,size:30 ,)

                        title: Transform.translate(
                          offset: Offset(10,0),
                            child: Text('Joined date')),
                        subtitle: Transform.translate(
                            offset: Offset(10,8),
                            child: Text('12/10/2022')),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      elevation: 2 ,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        selected: false,
                        leading:
                        Transform.translate(
                          offset: Offset(14, 6),
                          child: Icon(Icons.stacked_line_chart_outlined,size: 30,color: Colors.blueGrey,),
                        ),
                        //Icon(Icons.join_inner_rounded,color: Colors.cyan,size:30 ,)

                        title: Transform.translate(
                            offset: Offset(10,0),
                            child: Text('Active Projects')),
                        subtitle: Transform.translate(
                            offset: Offset(10,8),
                            child: Text('5')),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      elevation: 2 ,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        selected: false,
                        leading:
                        Transform.translate(
                          offset: Offset(14, 6),
                          child: Icon(Icons.cloud_done_rounded,size: 30,color: Colors.blueGrey,),
                        ),
                        //Icon(Icons.join_inner_rounded,color: Colors.cyan,size:30 ,)

                        title: Transform.translate(
                            offset: Offset(10,0),
                            child: Text('Completed Projects')),
                        subtitle: Transform.translate(
                            offset: Offset(10,8),
                            child: Text('12')),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      )  ,
    );
  }
}