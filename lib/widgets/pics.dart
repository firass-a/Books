
import 'package:flutter/material.dart';

class WelcomePics extends StatelessWidget {
  final double height;
  final double rotation;
  final String src;

  const WelcomePics(this.height, this.rotation, this.src, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Transform.rotate(
        angle: rotation,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            src,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
