import 'package:flutter/material.dart';
import 'package:news_app_sat/api/ApiManager.dart';
import 'package:news_app_sat/home/NewsListItem.dart';
import 'package:news_app_sat/model/NewsResponse.dart';
import 'package:news_app_sat/model/SouresResponse.dart';

class NewsFragment extends StatefulWidget {
  Source source;

  NewsFragment(this.source);

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  Future<NewsResponse> newsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture = loadNews(widget.source);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsFuture,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
              itemBuilder: (buildContext, index) {
                return NewsListItem(snapShot.data.articles[index]);
              },
              itemCount: snapShot.data.articles.length,
            );
          } else if (snapShot.hasError) {
            return Text('Error loading news');
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
