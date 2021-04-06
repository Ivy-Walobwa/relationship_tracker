import 'package:flutter/material.dart';
import '../widgets/photo.dart';
import '../data/Istages.dart';
import '../data/fake_data.dart';

class PhotoGallery extends StatelessWidget {

  final List<IStages> stagesList = imageListUrl.map<IStages>((json) => IStages.fromJson(json)).toList();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: stagesList
          .map((stage) => Photo(
        stage: stage
              ))
          .toList(),
    );
  }
}
