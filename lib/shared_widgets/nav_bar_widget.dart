import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.message,
            size: 29,
          ),
          label: "Message",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.pets,
            size: 29,
          ),
          label: "List of dogs",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.other_houses,
            size: 29,
          ),
          label: "User profile",
        ),
      ],
    );
  }
}
