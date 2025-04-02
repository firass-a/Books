import 'package:bookz/models/book.dart';
import 'package:bookz/models/cardprovider.dart';
import 'package:bookz/models/favs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class Details extends StatefulWidget {
  const Details(this.bk);
  final Books bk;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavsProvider>(context);
    bool isfavorite = favoriteProvider.isFavourite(widget.bk);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff111328),
        title: const Text(
          "Book Details",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.network(
                      widget.bk.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.bk.rating,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const Text(
                            "rating",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                favoriteProvider.toggleFavorits(widget.bk);
                              });
                            },
                            icon: Icon(
                              Icons.favorite_outline,
                              color: isfavorite ? Colors.red : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.bk.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Text(
              widget.bk.authors,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ReadMoreText(
                  trimMode: TrimMode.Line,
                  trimLines: 5,
                  widget.bk.description,
                  style: const TextStyle(color: Colors.grey, height: 2),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    final cart =
                        Provider.of<ShopProvider>(context, listen: false);
                    cart.addToCard(widget.bk);
                  },
                  child: const Text(
                    "Add to card",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
