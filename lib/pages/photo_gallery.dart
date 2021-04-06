import 'package:flutter/material.dart';
import '../widgets/photo.dart';
import '../models/Istages.dart';
import '../fake_data.dart';
import '../state-management/my_inherited_stages.dart';

class PhotoGallery extends StatefulWidget {
  static PhotoGalleryState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<MyInheritedStages>())
        .state;
  }

  @override
  PhotoGalleryState createState() => PhotoGalleryState();
}

class PhotoGalleryState extends State<PhotoGallery> {
  final List<IStages> stagesList =
      imageListUrl.map<IStages>((json) => IStages.fromJson(json)).toList();

  Set<String> tags = {'all', 'completed'};

  bool isTagging = false;

  void toggleTagging(String url) {
    setState(() {
      isTagging = !isTagging;
    });
  }

  void onPhotoSelect(String url, bool selected) {
    setState(() {
      stagesList.forEach((element) {
        if (element.url == url) {
          element.selected = selected;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedStages(
      state: this,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Relationship Stages'),
            centerTitle: true,
            bottom: TabBar(
              tabs: tags.map((tag) => Text(tag.toUpperCase())).toList(),
            ),
          ),
          body: TabBarView(
            children: [
              GridView.count(
                crossAxisCount: 2,
                children: stagesList
                    .where((element) => element.tag.contains(tags.elementAt(0)))
                    .map((stage) => Photo(
                          stage: stage,
                        ))
                    .toList(),
              ),
              GridView.count(
                crossAxisCount: 2,
                children: stagesList
                    .where((element) => element.tag.contains(tags.elementAt(1)))
                    .map((stage) => Photo(
                          stage: stage,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
