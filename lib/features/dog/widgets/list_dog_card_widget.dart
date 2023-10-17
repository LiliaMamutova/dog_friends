import 'package:flutter/material.dart';

import '../dog_model/dog_model.dart';

class ListDogCardWidget extends StatelessWidget {
  final DogModel item;

  const ListDogCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
