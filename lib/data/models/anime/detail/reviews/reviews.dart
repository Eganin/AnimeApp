import 'package:anime_app/data/models/anime/detail/reviews/reviewer.dart';

class Reviews {
  int malId;
  String url;
  String type;
  int helpfulCount;
  String date;
  Reviewer reviewer;
  String content;

  Reviews(
      {this.malId,
        this.url,
        this.type,
        this.helpfulCount,
        this.date,
        this.reviewer,
        this.content});

  Reviews.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    type = json['type'];
    helpfulCount = json['helpful_count'];
    date = json['date'];
    reviewer = json['reviewer'] != null
        ? new Reviewer.fromJson(json['reviewer'])
        : null;
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['type'] = this.type;
    data['helpful_count'] = this.helpfulCount;
    data['date'] = this.date;
    if (this.reviewer != null) {
      data['reviewer'] = this.reviewer.toJson();
    }
    data['content'] = this.content;
    return data;
  }
}