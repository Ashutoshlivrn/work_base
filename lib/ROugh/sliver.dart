import 'package:flutter/material.dart';

class SLIvers extends StatefulWidget {
  const SLIvers({Key? key}) : super(key: key);

  @override
  State<SLIvers> createState() => _SLIversState();
}

class _SLIversState extends State<SLIvers> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Column(
        children: [
          CustomScrollView(
            slivers: [

               SliverAppBar(
                title: Text('name'),
                expandedHeight: 200,
                floating: true,
                flexibleSpace: Container( color: Colors.red,),
              ),
              SliverToBoxAdapter(child: Container(
                color: Colors.blue,
                height: 400,
              )),
              SliverToBoxAdapter(child: Container(
                color: Colors.pink,
                height: 400,
              ))
            ],
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
