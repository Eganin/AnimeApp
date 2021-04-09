import 'package:anime_app/data/models/anime/detail/aired.dart';
import 'package:anime_app/data/models/anime/detail/other_data.dart';
import 'package:anime_app/data/models/anime/detail/related.dart';

class AnimeDetailInfo {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int malId;
  String url;
  String imageUrl;
  String trailerUrl;
  String title;
  String titleEnglish;
  String titleJapanese;
  List<String> titleSynonyms;
  String type;
  String source;
  int episodes;
  String status;
  bool airing;
  Aired aired;
  String duration;
  String rating;
  double score;
  int scoredBy;
  int rank;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String background;
  String premiered;
  String broadcast;
  Related related;
  List<OtherData> producers;
  List<OtherData> licensors;
  List<OtherData> studios;
  List<OtherData> genres;
  List<String> openingThemes;
  List<String> endingThemes;

  AnimeDetailInfo(
      {this.requestHash,
        this.requestCached,
        this.requestCacheExpiry,
        this.malId,
        this.url,
        this.imageUrl,
        this.trailerUrl,
        this.title,
        this.titleEnglish,
        this.titleJapanese,
        this.titleSynonyms,
        this.type,
        this.source,
        this.episodes,
        this.status,
        this.airing,
        this.aired,
        this.duration,
        this.rating,
        this.score,
        this.scoredBy,
        this.rank,
        this.popularity,
        this.members,
        this.favorites,
        this.synopsis,
        this.background,
        this.premiered,
        this.broadcast,
        this.related,
        this.producers,
        this.licensors,
        this.studios,
        this.genres,
        this.openingThemes,
        this.endingThemes});

  AnimeDetailInfo.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    trailerUrl = json['trailer_url'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleJapanese = json['title_japanese'];
    titleSynonyms = json['title_synonyms'].cast<String>();
    type = json['type'];
    source = json['source'];
    episodes = json['episodes'];
    status = json['status'];
    airing = json['airing'];
    aired = json['aired'] != null ? new Aired.fromJson(json['aired']) : null;
    duration = json['duration'];
    rating = json['rating'];
    score = json['score'] != null ? json['score'].toDouble() : 0.0;
    scoredBy = json['scored_by'];
    rank = json['rank'];
    popularity = json['popularity'];
    members = json['members'];
    favorites = json['favorites'];
    synopsis = json['synopsis'];
    background = json['background'];
    premiered = json['premiered'];
    broadcast = json['broadcast'];
    related =
    json['related'] != null ? new Related.fromJson(json['related']) : null;
    if (json['producers'] != null) {
      producers = [];
      json['producers'].forEach((v) {
        producers.add(new OtherData.fromJson(v));
      });
    }
    if (json['licensors'] != null) {
      licensors = [];
      json['licensors'].forEach((v) {
        licensors.add(new OtherData.fromJson(v));
      });
    }
    if (json['studios'] != null) {
      studios = [];
      json['studios'].forEach((v) {
        studios.add(new OtherData.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres.add(new OtherData.fromJson(v));
      });
    }
    openingThemes = json['opening_themes'].cast<String>();
    endingThemes = json['ending_themes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['trailer_url'] = this.trailerUrl;
    data['title'] = this.title;
    data['title_english'] = this.titleEnglish;
    data['title_japanese'] = this.titleJapanese;
    data['title_synonyms'] = this.titleSynonyms;
    data['type'] = this.type;
    data['source'] = this.source;
    data['episodes'] = this.episodes;
    data['status'] = this.status;
    data['airing'] = this.airing;
    if (this.aired != null) {
      data['aired'] = this.aired.toJson();
    }
    data['duration'] = this.duration;
    data['rating'] = this.rating;
    data['score'] = this.score;
    data['scored_by'] = this.scoredBy;
    data['rank'] = this.rank;
    data['popularity'] = this.popularity;
    data['members'] = this.members;
    data['favorites'] = this.favorites;
    data['synopsis'] = this.synopsis;
    data['background'] = this.background;
    data['premiered'] = this.premiered;
    data['broadcast'] = this.broadcast;
    if (this.related != null) {
      data['related'] = this.related.toJson();
    }
    if (this.producers != null) {
      data['producers'] = this.producers.map((v) => v.toJson()).toList();
    }
    if (this.licensors != null) {
      data['licensors'] = this.licensors.map((v) => v.toJson()).toList();
    }
    if (this.studios != null) {
      data['studios'] = this.studios.map((v) => v.toJson()).toList();
    }
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['opening_themes'] = this.openingThemes;
    data['ending_themes'] = this.endingThemes;
    return data;
  }
}




