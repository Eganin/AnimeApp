import 'package:anime_app/data/models/anime/detail/other_data.dart';
import 'package:anime_app/data/models/anime/detail/related.dart';
import 'package:anime_app/data/models/data.dart';
import 'package:anime_app/data/models/manga/published.dart';

class MangaDetailInfo extends Data{
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int malId;
  String url;
  String title;
  String titleEnglish;
  List<String> titleSynonyms;
  String titleJapanese;
  String status;
  String imageUrl;
  String type;
  int volumes;
  int chapters;
  bool publishing;
  Published published;
  int rank;
  double score;
  int scoredBy;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String background;
  Related related;
  List<OtherData> genres;
  List<OtherData> authors;
  List<OtherData> serializations;

  MangaDetailInfo(
      {this.requestHash,
        this.requestCached,
        this.requestCacheExpiry,
        this.malId,
        this.url,
        this.title,
        this.titleEnglish,
        this.titleSynonyms,
        this.titleJapanese,
        this.status,
        this.imageUrl,
        this.type,
        this.volumes,
        this.chapters,
        this.publishing,
        this.published,
        this.rank,
        this.score,
        this.scoredBy,
        this.popularity,
        this.members,
        this.favorites,
        this.synopsis,
        this.background,
        this.related,
        this.genres,
        this.authors,
        this.serializations});

  MangaDetailInfo.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    malId = json['mal_id'];
    url = json['url'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleSynonyms = json['title_synonyms'].cast<String>();
    titleJapanese = json['title_japanese'];
    status = json['status'];
    imageUrl = json['image_url'];
    type = json['type'];
    volumes = json['volumes'];
    chapters = json['chapters'];
    publishing = json['publishing'];
    published = json['published'] != null
        ? new Published.fromJson(json['published'])
        : null;
    rank = json['rank'];
    score = json['score'];
    scoredBy = json['scored_by'];
    popularity = json['popularity'];
    members = json['members'];
    favorites = json['favorites'];
    synopsis = json['synopsis'];
    background = json['background'];
    related =
    json['related'] != null ? new Related.fromJson(json['related']) : null;
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres.add(new OtherData.fromJson(v));
      });
    }
    if (json['authors'] != null) {
      authors = [];
      json['authors'].forEach((v) {
        authors.add(new OtherData.fromJson(v));
      });
    }
    if (json['serializations'] != null) {
      serializations = [];
      json['serializations'].forEach((v) {
        serializations.add(new OtherData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['title'] = this.title;
    data['title_english'] = this.titleEnglish;
    data['title_synonyms'] = this.titleSynonyms;
    data['title_japanese'] = this.titleJapanese;
    data['status'] = this.status;
    data['image_url'] = this.imageUrl;
    data['type'] = this.type;
    data['volumes'] = this.volumes;
    data['chapters'] = this.chapters;
    data['publishing'] = this.publishing;
    if (this.published != null) {
      data['published'] = this.published.toJson();
    }
    data['rank'] = this.rank;
    data['score'] = this.score;
    data['scored_by'] = this.scoredBy;
    data['popularity'] = this.popularity;
    data['members'] = this.members;
    data['favorites'] = this.favorites;
    data['synopsis'] = this.synopsis;
    data['background'] = this.background;
    if (this.related != null) {
      data['related'] = this.related.toJson();
    }
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.authors != null) {
      data['authors'] = this.authors.map((v) => v.toJson()).toList();
    }
    if (this.serializations != null) {
      data['serializations'] =
          this.serializations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}