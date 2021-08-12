import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_sat/model/NewsItem.dart';

class NewsListItem extends StatelessWidget {
  NewsItem news;

  NewsListItem(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              placeholder: (buildContext, url) =>
                  Center(child: CircularProgressIndicator()),
            ),
          ),
          Text(
            news.author ?? "",
            style: TextStyle(fontWeight: FontWeight.w300),
            textAlign: TextAlign.start,
          ),
          Text(
            news.title ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          Text(
            news.publishedAt ?? "",
            textAlign: TextAlign.end,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
