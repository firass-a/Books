import 'package:bookz/models/cardprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<ShopProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff111328),
        title: const Text("My Orders"),
      ),
      body: book.shoppedBooks.isEmpty
          ? const Center(child: Text("You have no orders yet"))
          : ListView.builder(
              itemCount: Provider.of<ShopProvider>(context).shoppedBooks.length,
              itemBuilder: (context, index) {
                final book = Provider.of<ShopProvider>(context)
                    .shoppedBooks
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
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.network(
                                  book.image,
                                  height: 150,
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
                                  Text(book.rating),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: TextButton(
                                        onPressed: () {
                                          final bkpr =
                                              Provider.of<ShopProvider>(context,
                                                  listen: false);
                                          bkpr.addToCard(book);
                                        },
                                        child: Text("Remove from wallet")),
                                  )
                                ],
                              ),
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
