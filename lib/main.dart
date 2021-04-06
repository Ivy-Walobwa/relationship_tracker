import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'pages/photo_gallery.dart';
import 'state-management/photo_gallery_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: PhotoGalleryState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: PhotoGallery(),
      ),
    );
  }
}
