class IStages {
  final String url;
  final String stage;
  final String description;
  bool selected;

  IStages({this.url, this.stage, this.description, this.selected = false});

  factory IStages.fromJson(Map<String, dynamic> json) {
    return IStages(
      url: json['url'],
      description: json['description'],
      stage: json['stage'],
    );
  }
}
