import 'package:flutter/material.dart';
import '../models/Istages.dart';
import '../state-management/photo_gallery_state.dart';
import 'package:provider/provider.dart';

class Photo extends StatelessWidget {
  Photo(
      {@required this.stage,});

  final IStages stage;

  @override
  Widget build(BuildContext context) {

    return Stack(
          children: [
            GestureDetector(
              child: Card(
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
              ),
              onLongPress: () => context.read<PhotoGalleryState>().toggleTagging(stage.url),
            ),
            if(context.watch<PhotoGalleryState>().isTagging)
            Positioned(
              child: Theme(
                data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.grey),
                child: Checkbox(
                  value: stage.selected,
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                  onChanged: (value) {
                    context.read<PhotoGalleryState>().onPhotoSelect(stage.url, value);
                    if(stage.selected){
                      stage.tag.add('completed');
                    }else{
                      stage.tag.remove('completed');
                    }
                  },
                ),
              ),
              left: 0,
              top: 0,
            )
          ],
        );

  }
}
