import 'package:flutter/material.dart';
import '../pages/photo_gallery.dart';

class MyInheritedStages extends InheritedWidget {
  final PhotoGalleryState state;

  MyInheritedStages({Key key, @required Widget child, @required this.state})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

}
