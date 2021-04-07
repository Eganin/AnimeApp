import 'package:anime_app/data/models/anime/detail/episodes/episodes.dart';

class AnimeEpisodes {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int episodesLastPage;
  List<Episodes> episodes;

  AnimeEpisodes(
      {this.requestHash,
        this.requestCached,
        this.requestCacheExpiry,
        this.episodesLastPage,
        this.episodes});

  AnimeEpisodes.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    episodesLastPage = json['episodes_last_page'];
    if (json['episodes'] != null) {
      episodes = [];
      json['episodes'].forEach((v) {
        episodes.add(new Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    data['episodes_last_page'] = this.episodesLastPage;
    if (this.episodes != null) {
      data['episodes'] = this.episodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}