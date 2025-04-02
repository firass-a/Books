import 'package:bookz/models/book.dart';
import 'package:bookz/screens/details.dart';
import 'package:bookz/services/booksvc.dart';
import 'package:bookz/widgets/drawercnt.dart';
import 'package:bookz/widgets/dropdownmenue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late Future<List<Books>> books;
  ValueNotifier<String>? categoryNotifier;

  @override
  void initState() {
    super.initState();
    books = BookService.fetchBooks(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categoryNotifier ??= Provider.of<ValueNotifier<String>>(context, listen: false);
    categoryNotifier!.addListener(_updateBooks);
  }

  void _updateBooks() {
    setState(() {
      books = BookService.fetchBooks(context);
    });
  }

  @override
  void dispose() {
    categoryNotifier?.removeListener(_updateBooks);
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff111328),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu_book_sharp),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: const Center(child: Text("Home")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      drawer: const DrawerContent(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Which book do \nyou want to buy?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[900],
                        hintText: "Search books",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.format_list_bulleted_sharp),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Books",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                DropDown(),
              ],
            ),
            const SizedBox(height: 5),
            Expanded(
              child: FutureBuilder<List<Books>>(
                future: books,
                builder: (context, AsyncSnapshot<List<Books>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No books found"));
                  }

                  List<Books> booksList = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: booksList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Details(booksList[index]),
                                ),
                              );
                            },
                            child: Image.network(
                              booksList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
