import 'package:news_app_sat/model/SouresResponse.dart';

class NewsItem {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  NewsItem.fromJsonMap(Map<String, dynamic> map)
      : source = Source.fromJson(map["source"]),
        author = map["author"],
        title = map["title"],
        description = map["description"],
        url = map["url"],
        urlToImage = map["urlToImage"],
        publishedAt = map["publishedAt"],
        content = map["content"];
}
