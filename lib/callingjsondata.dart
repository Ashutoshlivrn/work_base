import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:work_base/ROugh/gettingJson.dart';

class CallingJson extends StatefulWidget {
  const CallingJson({Key? key}) : super(key: key);

  @override
  State<CallingJson> createState() => _CallingJsonState();
}

var jsonbody;
var mapresponse;

class _CallingJsonState extends State<CallingJson> {
  Future jsonData() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users/2'));

    if (response.statusCode == 200) {
      setState(() {
        jsonbody = response.body.toString();
        mapresponse = jsonDecode(response.body);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jsonData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        Text(mapresponse["support"].toString()),
      ),
    );
  }
}
