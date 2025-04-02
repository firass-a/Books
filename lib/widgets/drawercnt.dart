import 'package:bookz/widgets/sidebarelements.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff111328),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      "Menu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const SideBarElement("profile", Icons.account_circle_outlined),
              const SizedBox(
                height: 30,
              ),
              const SideBarElement("Offers", Icons.percent),
              const SizedBox(
                height: 30,
              ),
              const SideBarElement("Reviews", Icons.star),
              const SizedBox(
                height: 30,
              ),
              const SideBarElement("Receipt", Icons.receipt),
              const SizedBox(
                height: 30,
              ),
              const SideBarElement("Locate Shop", Icons.location_on),
              const SizedBox(
                height: 30,
              ),
              const SideBarElement("Delivery", Icons.delivery_dining_sharp),
            ],
          ),
        ),
      ),
    );
  }
}
