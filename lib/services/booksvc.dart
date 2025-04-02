import 'dart:convert';

import 'package:bookz/models/book.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BookService {
  static Future<List<Books>> fetchBooks(BuildContext context) async {
    var querry =
        Provider.of<ValueNotifier<String>>(context, listen: false).value;

    final res = await http.get(Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=subject:$querry"));
   

    if (res.statusCode == 200) {
      final jsonData = jsonDecode(res.body) as Map<String, dynamic>;
      if (jsonData["items"] == null) {
        throw Exception("No books found");
      } else {
        return (jsonData["items"] as List)
            .map((book) => Books.fromJson(book))
            .toList();
      }
    } else {
      throw Exception("Failed to fetch books");
    }
  }
}
