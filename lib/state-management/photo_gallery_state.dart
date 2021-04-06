import 'package:flutter/cupertino.dart';
import '../models/Istages.dart';
import '../fake_data.dart';

class PhotoGalleryState extends ChangeNotifier {
  List<IStages> _stagesList =
  imageListUrl.map<IStages>((json) => IStages.fromJson(json)).toList();


  List<IStages> get stagesList {
    return [..._stagesList];
  }

  Set<String> tags = {'all', 'completed'};

  bool isTagging = false;

  void toggleTagging(String url) {
    isTagging = !isTagging;
    notifyListeners();
  }

  void onPhotoSelect(String url, bool selected) {
    stagesList.forEach((element) {
      if (element.url == url) {
        element.selected = selected;
      }
    });
    notifyListeners();
  }


}