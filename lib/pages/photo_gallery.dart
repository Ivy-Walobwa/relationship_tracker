import 'package:flutter/material.dart';
import '../widgets/photo.dart';
import '../state-management/photo_gallery_state.dart';
import 'package:provider/provider.dart';

class PhotoGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var tags = context.watch<PhotoGalleryState>().tags;
    var stagesList = context.read<PhotoGalleryState>().stagesList;
    return DefaultTabController(
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
        );

  }
}
