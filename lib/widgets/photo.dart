import 'package:flutter/material.dart';
import '../data/Istages.dart';


class Photo extends StatelessWidget {
  Photo({@required this.stage});

  final IStages stage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(stage.url),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(stage.stage),
            )
          ],
        ),
      ),
    );
  }
}