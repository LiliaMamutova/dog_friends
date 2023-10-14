import 'package:flutter/material.dart';

import 'dog_info.model.dart';
import 'text_scaler.dart';

class GridDogs extends StatelessWidget {
  const GridDogs({
    super.key,
    required this.dogsList,
    required this.columnsCount,
  });

  final List<DogInfo> dogsList;
  final int columnsCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dogsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnsCount,
        mainAxisExtent: 180,
      ),
      itemBuilder: (BuildContext context, int index) {
        final DogInfo dog = dogsList[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(dog.image),
                      radius: 55,
                    ),
                    Text(
                      dog.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "LilitaOneScript",
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dog.gender,
                      textScaleFactor: textScaleFactor(context),
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "LilitaOneScript",
                      ),
                    ),
                    Text(
                      dog.breed,
                      textScaleFactor: textScaleFactor(context),
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "LilitaOneScript",
                      ),
                    ),
                    Text(
                      dog.birthDate,
                      textScaleFactor: textScaleFactor(context),
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "LilitaOneScript",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
