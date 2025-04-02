import 'package:bookz/models/book.dart';
import 'package:bookz/screens/card.dart';
import 'package:bookz/screens/favorites.dart';
import 'package:bookz/screens/homepage.dart';
import 'package:bookz/screens/settings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Books>> books;

  final PageController pageController = PageController();
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const Favorites(),
    const Cards(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),

      // ✅ Move BottomNavigationBar here
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF1E1E2C), width: 5),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: const Color(0xFF1E1E2C),
          elevation: 0,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.white,
          iconSize: 30,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: "Card"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
