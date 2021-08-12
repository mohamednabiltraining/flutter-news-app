import 'dart:convert';

import 'package:news_app_sat/model/NewsResponse.dart';
import 'package:news_app_sat/model/SouresResponse.dart';
import 'package:http/http.dart' as http;

Future<SourcesResponse> getNewsSources(String categoryId) async {
  final uri = Uri.https('newsapi.org', '/v2/top-headlines/sources',
      {'apiKey': '5909ae28122a471d8b0c237d5989cb73', 'category': categoryId});
  final response = await http.get(uri,
      headers: {'Authorization': 'Bearer 5909ae28122a471d8b0c237d5989cb73'});
  print(response.body);
  if (response.statusCode == 200) {
    return SourcesResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future<NewsResponse> loadNews(Source source) async {
  final uri = Uri.https('newsapi.org', '/v2/everything',
      {'apiKey': '5909ae28122a471d8b0c237d5989cb73', 'sources': source.id});
  final response = await http.get(uri);
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return NewsResponse.fromJsonMap(jsonDecode(response.body));
  }
  throw Exception(response.body);
}
