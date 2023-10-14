import 'package:flutter/material.dart';

import 'grid_dogs_widget.dart';
import 'list_dogs_mock_data.dart';
import 'list_dogs_widget.dart';

class DogsListScreen extends StatefulWidget {
  const DogsListScreen({super.key});

  @override
  State<DogsListScreen> createState() => _DogsListScreenState();
}

class _DogsListScreenState extends State<DogsListScreen> {
  bool isGridView = false;

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
    final bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final bool isEnoughWidth = MediaQuery.of(context).size.width > 932;
    final int columnsCount = isLandScape && isEnoughWidth ? 4 : 2;

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
        child: isLandScape
            ? GridDogs(
                dogsList: dogsList,
                columnsCount: columnsCount,
              )
            : ListDogs(dogsList: dogsList),
      ),
    );
  }
}
