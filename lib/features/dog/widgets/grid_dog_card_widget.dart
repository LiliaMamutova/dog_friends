import 'package:dog_friends/features/dog/dog_model/dog_model.dart';
import 'package:flutter/material.dart';

import '../helper/text_scaler.dart';

class GridDogCardWidget extends StatelessWidget {
  final DogModel dog;

  const GridDogCardWidget({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
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
  }
}
