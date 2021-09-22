import 'package:anime_app/data/models/data_card.dart';

class SearchData {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Results> results;
  int lastPage;

  SearchData(
      {this.requestHash,
        this.requestCached,
        this.requestCacheExpiry,
        this.results,
        this.lastPage});

  SearchData.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['last_page'] = this.lastPage;
    return data;
  }
}

class Results extends DataCard{
  int malId;
  String url;
  String imageUrl;
  String title;
  bool airing;
  String synopsis;
  String type;
  int episodes;
  double score;
  String startDate;
  String endDate;
  int members;
  String rated;

  Results(
      {this.malId,
        this.url,
        this.imageUrl,
        this.title,
        this.airing,
        this.synopsis,
        this.type,
        this.episodes,
        this.score,
        this.startDate,
        this.endDate,
        this.members,
        this.rated});

  Results.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    title = json['title'];
    airing = json['airing'];
    synopsis = json['synopsis'];
    type = json['type'];
    episodes = json['episodes'];
    score = json['score'].toDouble();
    startDate = json['start_date'];
    endDate = json['end_date'];
    members = json['members'];
    rated = json['rated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['airing'] = this.airing;
    data['synopsis'] = this.synopsis;
    data['type'] = this.type;
    data['episodes'] = this.episodes;
    data['score'] = this.score;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['members'] = this.members;
    data['rated'] = this.rated;
    return data;
  }
}