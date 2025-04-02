import 'package:bookz/models/cardprovider.dart';
import 'package:bookz/models/favs.dart';
import 'package:bookz/screens/favorites.dart';
import 'package:bookz/screens/screens.dart';
import 'package:bookz/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:bookz/screens/WelcomScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => FavsProvider()) ,
        ChangeNotifierProvider(create: (context)=>ShopProvider())
      ],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
//Color(0xff1d1e33);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ValueNotifier<String>("romance"),
      child: MaterialApp(
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: const Color(0xff111328)),
        initialRoute: '/',
        routes: {
          '/': (context) => const Welcomscreen(),
          '/signin': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/fave': (context) => const Favorites(),
        },
      ),
    );
  }
}
