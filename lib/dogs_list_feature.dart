import 'package:flutter/material.dart';

class DogsListScreen extends StatefulWidget {
  const DogsListScreen({super.key});

  @override
  State<DogsListScreen> createState() => _DogsListScreenState();
}

class _DogsListScreenState extends State<DogsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Information for dog",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "LilitaOneScript",
                  fontSize: 18,
                ),
              ),
              SizedBox.fromSize(
                child: Image.asset(
                  "assets/images/tokyo.jpeg",
                  height: 150,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox.fromSize(
                child: Image.asset(
                  "assets/images/bublyk.jpeg",
                  height: 150,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox.fromSize(
                child: Image.asset(
                  "assets/images/javelina.jpeg",
                  height: 150,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        ]),
      ),
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
            icon: Icon(Icons.pets),
            label: "List of dogs",
          ),
        ],
      ),
    );
  }
}
