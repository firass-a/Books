import 'dart:math';
import 'package:bookz/widgets/pics.dart';
import 'package:flutter/material.dart';

class Welcomscreen extends StatelessWidget {
  const Welcomscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Stack(
                children: [
                  WelcomePics(350, pi - 10, "assets/potter.jpg"),
                  WelcomePics(350, pi + 10, "assets/lor.jpg"),
                  Positioned(
                      right: 5,
                      bottom: 5,
                      child: WelcomePics(300, 0, "assets/harry.jpg")),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "BookZ",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "📚 Where Every Page Tells a Story! 📖✨",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500, height: 3),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: const Text(
                      "Take an adventure !",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
