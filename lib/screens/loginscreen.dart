import 'package:bookz/widgets/logincard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.disabled_by_default_rounded,
                color: Colors.blueGrey[900],
                size: 50,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sign In",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "please fill up phone number and password to log in to your account",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const logincard(),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? newValue) {}),
                    const Text(
                      "Save password",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const Text(
                  "Forget Password ?",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
