import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_sat/api/ApiManager.dart';
import 'package:news_app_sat/home/HomeFragment.dart';
import 'package:news_app_sat/home/SideMenu.dart';
import 'package:news_app_sat/home/categories/CategoriesFragment.dart';
import 'package:news_app_sat/model/Category.dart';
import 'package:news_app_sat/model/SouresResponse.dart';
import 'package:news_app_sat/home/HomeTabsScreen.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = "Home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Category selectedCatogory = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/bg.png',
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Route News App'),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80))),
        ),
        drawer: Drawer(
          child: SideMenu(onSideMenuItemClick),
        ),
        body: selectedCatogory == null
            ? CategoriesFragment(onCategoryClickCallBack)
            : HomeFragment(selectedCatogory),
      ),
    );
  }

  void onCategoryClickCallBack(Category category) {
    setState(() {
      selectedCatogory = category;
    });
  }

  void onSideMenuItemClick(SideMenuItem sideMenuItem) {
    Navigator.of(context).pop();
    if (sideMenuItem.id == SideMenuItem.CATEGORIES) {
      setState(() {
        selectedCatogory = null;
      });
    } else if (sideMenuItem.id == SideMenuItem.SETTINGS) {}
  }
}
