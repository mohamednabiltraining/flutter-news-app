import 'package:news_app_sat/model/NewsItem.dart';

class NewsResponse {
  String status;
  int totalResults;
  List<NewsItem> articles;

  NewsResponse.fromJsonMap(Map<String, dynamic> map)
      : status = map["status"],
        totalResults = map["totalResults"],
        articles = List<NewsItem>.from(
            map["articles"].map((it) => NewsItem.fromJsonMap(it)));
}
