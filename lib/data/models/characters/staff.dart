class Staff {
  int malId;
  String url;
  String name;
  String imageUrl;
  List<String> positions;

  Staff({this.malId, this.url, this.name, this.imageUrl, this.positions});

  Staff.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    name = json['name'];
    imageUrl = json['image_url'];
    positions = json['positions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['positions'] = this.positions;
    return data;
  }
}