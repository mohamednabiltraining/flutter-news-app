import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_sat/api/ApiManager.dart';
import 'package:news_app_sat/home/SideMenu.dart';
import 'package:news_app_sat/model/SouresResponse.dart';
import 'package:news_app_sat/home/HomeTabsScreen.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = "Home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<SourcesResponse> newsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture = getNewsSources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route News App'),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80))),
      ),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: FutureBuilder<SourcesResponse>(
        future: newsFuture,
        builder: (builContext, snapShot) {
          if (snapShot.hasData) {
            return HomeTabs(snapShot.data.sources);
          } else if (snapShot.hasError) {
            return Text('error loading data'); // assignment reload
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
