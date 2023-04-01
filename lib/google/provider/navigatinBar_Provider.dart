import 'package:flutter/material.dart';

class Bar extends ChangeNotifier {
  int i = 0;

  void select(int value) {
    i = value;
    notifyListeners();
  }
}