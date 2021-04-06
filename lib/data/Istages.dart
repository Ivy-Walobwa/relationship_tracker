class IStages {
  final String url;
  final String stage;
  final String description;
  bool selected;
  Set<String> tag;

  IStages({this.url, this.stage, this.description, this.selected = false,this.tag});

  factory IStages.fromJson(Map<String, dynamic> json) {
    return IStages(
      url: json['url'],
      description: json['description'],
      stage: json['stage'],
      tag: {'all'}
    );
  }
}
