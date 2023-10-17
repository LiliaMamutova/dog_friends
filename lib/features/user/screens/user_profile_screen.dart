import 'package:dog_friends/value_notifier/vn.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            floating: false,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  notifier.value = notifier.value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
                },
                icon: const Icon(
                  Icons.pets,
                  size: 30,
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Dog friends",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: const Color(0xffc7c0c8)),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: Color(0xCE06354E),
            ),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pets,
              color: Color(0xCE06354E),
            ),
            label: "List of dogs",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color(0xCE06354E),
            ),
            label: "Search of dogs",
          ),
        ],
      ),
    );
  }
}
// }
