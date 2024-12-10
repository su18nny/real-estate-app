import 'package:flutter/material.dart';
class Dynamicscreenutil{
  final BuildContext task;
  Dynamicscreenutil(this.task);
  double sizehieght(double height){
    return MediaQuery.of(task).size.height*height;
  }
  double sizewidth(double width){
    return MediaQuery.of(task).size.width*width;
  }
  double get fullHeight=>MediaQuery.of(task).size.height;

  double get fullWidth=>MediaQuery.of(task).size.height;
}
