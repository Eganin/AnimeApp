import 'package:anime_app/data/models/anime/detail/reviews/scores.dart';

class Reviewer {
  String url;
  String imageUrl;
  String username;
  int episodesSeen;
  Scores scores;

  Reviewer(
      {this.url, this.imageUrl, this.username, this.episodesSeen, this.scores});

  Reviewer.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    imageUrl = json['image_url'];
    username = json['username'];
    episodesSeen = json['episodes_seen'];
    scores =
    json['scores'] != null ? new Scores.fromJson(json['scores']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['username'] = this.username;
    data['episodes_seen'] = this.episodesSeen;
    if (this.scores != null) {
      data['scores'] = this.scores.toJson();
    }
    return data;
  }
}