import 'package:dog_friends/features/user/screens/chat_screen.dart';
import 'package:dog_friends/features/user/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../dog/screen/dogs_list_feature.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int bottomSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => context.push("/setting"),
            child: const Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (pageIndex) {
          bottomTapped(pageIndex);
        },
        currentIndex: bottomSelectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.other_houses,
              size: 29,
            ),
            label: strings.bottomNavigationBarIconUserProfile,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.pets,
              size: 29,
            ),
            label: strings.bottomNavigationBarIconListOfDogs,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.message,
              size: 29,
            ),
            label: strings.bottomNavigationBarIconMessage,
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (pageIndex) {
          pageChanged(pageIndex);
        },
        controller: _pageController,
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          UserProfileScreen(),
          DogsListScreen(),
          ChatScreen(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int pageIndex) {
    setState(() {
      bottomSelectedIndex = pageIndex;
    });
  }

  void bottomTapped(int pageIndex) {
    setState(
      () {
        bottomSelectedIndex = pageIndex;
        print(pageIndex);
        _pageController.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 300),
          curve: Cubic(0, 0.5, 0.7, 1),
        );
      },
    );
  }
}
