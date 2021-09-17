import 'package:flutter/cupertino.dart';

class PageManager{
  PageController _pageController;
  int page = 0;

  PageManager(this._pageController);

  void setPage(int value){
    if(value == page) return;
    page = value;
    _pageController.jumpToPage(value);
  }
}