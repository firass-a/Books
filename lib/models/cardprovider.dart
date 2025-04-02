import 'package:bookz/models/book.dart';
import 'package:flutter/material.dart';

class ShopProvider extends ChangeNotifier {
  final Set<Books> _shoppedBooks = {};

  Set<Books> get shoppedBooks => _shoppedBooks;

  void addToCard(Books book) {
    if (shoppedBooks.contains(book)) {
      shoppedBooks.remove(book);
    } else {
      shoppedBooks.add(book);
    }
    notifyListeners();
  }
}
