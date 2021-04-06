import 'package:flutter/material.dart';
import '../models/Istages.dart';
import '../pages/photo_gallery.dart';

class Photo extends StatelessWidget {
  Photo(
      {@required this.stage,});

  final IStages stage;



  @override
  Widget build(BuildContext context) {
    final container = PhotoGallery.of(context);
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
          onLongPress: () => container.toggleTagging(stage.url),
        ),
        if(container.isTagging)
        Positioned(
          child: Theme(
            data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.grey),
            child: Checkbox(
              value: stage.selected,
              activeColor: Colors.white,
              checkColor: Colors.black,
              onChanged: (value) {
                container.onPhotoSelect(stage.url, value);
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
