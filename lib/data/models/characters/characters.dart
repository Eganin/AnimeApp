import 'package:anime_app/data/models/characters/voice_actors.dart';

class Characters {
  int malId;
  String url;
  String imageUrl;
  String name;
  String role;
  List<VoiceActors> voiceActors;

  Characters(
      {this.malId,
        this.url,
        this.imageUrl,
        this.name,
        this.role,
        this.voiceActors});

  Characters.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    name = json['name'];
    role = json['role'];
    if (json['voice_actors'] != null) {
      voiceActors = [];
      json['voice_actors'].forEach((v) {
        voiceActors.add(new VoiceActors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['role'] = this.role;
    if (this.voiceActors != null) {
      data['voice_actors'] = this.voiceActors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}