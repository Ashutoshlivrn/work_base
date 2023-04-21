import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' ;

class getthedata extends ChangeNotifier{
static String databody = '';

  void interchange( Response fromnetdata){
    databody =  fromnetdata.body;
    notifyListeners();
  }
}