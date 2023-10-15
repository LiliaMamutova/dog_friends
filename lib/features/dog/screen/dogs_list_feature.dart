import 'package:flutter/material.dart';

import '../mock_data/list_dogs_mock_data.dart';
import '../widgets/grid_dogs_widget.dart';
import '../widgets/list_dogs_widget.dart';

class DogsListScreen extends StatefulWidget {
  const DogsListScreen({super.key});

  @override
  State<DogsListScreen> createState() => _DogsListScreenState();
}

class _DogsListScreenState extends State<DogsListScreen> {
  bool isGridView = false;
  static const int minimalScreenWidth = 932;

  void changeView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  void goToMessage(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const MessageScreen()));
  }

  void goToDogsList(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const DogsListFeature()));
  }

  void goToSearch(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const SearchScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final bool isEnoughWidth =
        MediaQuery.of(context).size.width > minimalScreenWidth;
    final int columnsCount = isLandscape && isEnoughWidth ? 4 : 2;

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: changeView,
          icon: const Icon(
            Icons.pets,
            size: 45,
            color: Color(0xCE06284E),
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: "List of dogs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search of dogs",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: isLandscape
            ? DogsGridWidget(
                dogsList: dogsList,
                columnsCount: columnsCount,
              )
            : DogsListWidget(dogsList: dogsList),
      ),
    );
  }
}
