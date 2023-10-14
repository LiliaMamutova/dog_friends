import 'package:flutter/material.dart';

import 'dog_model.dart';

class DogsListWidget extends StatelessWidget {
  const DogsListWidget({
    super.key,
    required this.dogsList,
  });

  final List<DogModel> dogsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dogsList.length,
      itemBuilder: (BuildContext context, int index) {
        final DogModel item = dogsList[index];
        return GestureDetector(
          onTap: () {},
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    item.image,
                    width: 70,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "LilitaOneScript",
                          ),
                        ),
                        Text(
                          item.gender,
                          style: const TextStyle(
                              fontSize: 15, fontFamily: "LilitaOneScript"),
                        ),
                        Text(
                          item.breed,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: "LilitaOneScript",
                            color: Color(0xCE06284E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
