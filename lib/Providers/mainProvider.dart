import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mainProvider extends ChangeNotifier{

  bool isMobile(double width) => width< 600;
  bool isDesktop(double width) => width >600;
  bool _isHovered = false ;


  bool get isHovered => _isHovered;

  void Tap(value){
    _isHovered = value;
    notifyListeners();
  }


}