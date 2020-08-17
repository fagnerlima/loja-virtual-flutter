import 'package:flutter/cupertino.dart';

class PageManager {

  PageManager(this._pageController);

  PageController _pageController;
  int _page = 0;

  int get page {
    return _page;
  }

  set page(int value) {
    if (this._page == value) return;

    this._page = value;
    _pageController.jumpToPage(value);
  }
}