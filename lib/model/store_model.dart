
import 'package:flutter/material.dart';

import 'book.dart';

class StoreModel extends ChangeNotifier{
  final List<Book> books;

  StoreModel({required this.books});

  void addBook(Book book){
    books.add(book);
    notifyListeners();
  }

  void deleteBook(int index){
    books.removeAt(index);
    notifyListeners();
  }
}