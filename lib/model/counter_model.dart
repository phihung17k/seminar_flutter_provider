import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier{
  int counter;

  CounterModel({required this.counter});

  void incrementCounter(){
    counter++;
    notifyListeners();
  }

  void decrementCounter(){
    counter--;
    notifyListeners();
  }
}