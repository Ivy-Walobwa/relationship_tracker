import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/photo.dart';
import '../state-management/photo_gallery_state.dart';

class PhotoGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PhotoGalleryState>(
      builder: (context, child,  model) {
        var tags = model.tags;
        var stagesList = model.stagesList;
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
    );
  }
}
