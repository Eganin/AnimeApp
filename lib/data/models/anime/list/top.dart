import 'package:anime_app/data/models/data_card.dart';

class Top extends DataCard{
  int malId;
  int rank;
  String title;
  String url;
  String imageUrl;
  String type;
  int episodes;
  String startDate;
  String endDate;
  int members;
  double score;
  int volumes = 0;

  Top(
      {this.malId,
        this.rank,
        this.title,
        this.url,
        this.imageUrl,
        this.type,
        this.episodes,
        this.startDate,
        this.endDate,
        this.members,
        this.score,
      this.volumes});

  Top.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    rank = json['rank'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['image_url'];
    type = json['type'];
    episodes = json['episodes'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    members = json['members'];
    score = json['score'].toDouble();
    volumes = json['volumes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['rank'] = this.rank;
    data['title'] = this.title;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['type'] = this.type;
    data['episodes'] = this.episodes;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['members'] = this.members;
    data['score'] = this.score;
    data['volumes'] = this.volumes;
    return data;
  }
}