class VoiceActors {
  int malId;
  String name;
  String url;
  String imageUrl;
  String language;

  VoiceActors({this.malId, this.name, this.url, this.imageUrl, this.language});

  VoiceActors.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    name = json['name'];
    url = json['url'];
    imageUrl = json['image_url'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['name'] = this.name;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['language'] = this.language;
    return data;
  }
}