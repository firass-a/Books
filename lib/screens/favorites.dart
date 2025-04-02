import 'package:bookz/models/favs.dart';
import 'package:bookz/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff111328),
        title: const Text("You favorite books"),
      ),
      body: Provider.of<FavsProvider>(context).favoriteBooks.isEmpty
          ? const Center(child: Text("You have no favorites yet"))
          : ListView.builder(
              itemCount:
                  Provider.of<FavsProvider>(context).favoriteBooks.length,
              itemBuilder: (context, index) {
                final book = Provider.of<FavsProvider>(context)
                    .favoriteBooks
                    .elementAt(index);

                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFF1E1E2C)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Details(book)));
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: Image.network(
                                    book.image,
                                    height: 150,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(book.authors),
                                  Text(book.rating)
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    final favProvider =
                                        Provider.of<FavsProvider>(context,
                                            listen: false);
                                    favProvider.toggleFavorits(book);
                                  },
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
