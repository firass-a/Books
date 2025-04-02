import 'package:bookz/models/book.dart';
import 'package:flutter/material.dart';

class FavsProvider extends ChangeNotifier {
  final Set<Books> _favouriteBooks = {};

  Set<Books> get favoriteBooks => _favouriteBooks;

  void toggleFavorits(Books book) {
    if (_favouriteBooks.contains(book)) {
      _favouriteBooks.remove(book);
    } else {
      _favouriteBooks.add(book);
    }
    notifyListeners();
  }

  bool isFavourite(Books book) {
    return _favouriteBooks.contains(book);
  }
}
