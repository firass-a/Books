import 'package:flutter/material.dart';

class SideBarElement extends StatelessWidget {
  final String txt;
  final IconData icn;

  const SideBarElement(this.txt, this.icn, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[900], shape: BoxShape.circle),
              child: Icon(
                icn,
                color: Colors.grey,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                txt,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.grey,
        ),
      ],
    );
  }
}
