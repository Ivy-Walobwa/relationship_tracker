import 'package:flutter/material.dart';
import '../data/Istages.dart';

class Photo extends StatelessWidget {
  Photo(
      {@required this.stage,
      this.onLongPress,
      this.onSelected,
      this.selectable, });

  final IStages stage;
  final bool selectable;
  final Function onLongPress;
  final Function onSelected;

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
          onLongPress: () => onLongPress(stage.url),
        ),
        if(selectable)
        Positioned(
          child: Theme(
            data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.grey),
            child: Checkbox(
              value: stage.selected,
              activeColor: Colors.white,
              checkColor: Colors.black,
              onChanged: (value) {
                onSelected(stage.url, value);
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
