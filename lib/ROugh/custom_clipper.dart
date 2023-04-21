import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width,0);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(0, size.height);
    return path;
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
    throw UnimplementedError();
  }
  
}