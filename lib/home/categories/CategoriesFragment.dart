import 'package:flutter/material.dart';
import 'package:news_app_sat/ThemeProvider.dart';
import 'package:news_app_sat/home/categories/CategoryItem.dart';
import 'package:news_app_sat/model/Category.dart';

class CategoriesFragment extends StatelessWidget {
  Function onCategoryItemCallBack;

  CategoriesFragment(this.onCategoryItemCallBack) {
    buildCategoriesList();
    print(categories);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Choose your Favourite',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              itemBuilder: (buildContext, index) {
                return CategoryItem(categories[index], (Category category) {
                  onCategoryItemCallBack(category);
                });
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }

  List<Category> categories = [];

  void buildCategoriesList() {
    //entertainment
    categories.add(Category(
        id: 'sports',
        title: 'sports',
        imagePath: 'assets/sports.png',
        color: MyThemeData.RedColor,
        rightSided: true));

    categories.add(Category(
        id: 'general',
        title: 'general',
        imagePath: 'assets/Politics.png',
        color: MyThemeData.BlueColor,
        rightSided: false));

    categories.add(Category(
        id: 'health',
        title: 'health',
        imagePath: 'assets/health.png',
        color: MyThemeData.PinkColor,
        rightSided: true));

    categories.add(Category(
        id: 'business',
        title: 'business',
        imagePath: 'assets/bussines.png',
        color: MyThemeData.DarkOrangeColor,
        rightSided: false));

    categories.add(Category(
        id: 'technology',
        title: 'technology',
        imagePath: 'assets/environment.png',
        color: MyThemeData.OceanBlueColor,
        rightSided: true));

    categories.add(Category(
        id: 'science',
        title: 'science',
        imagePath: 'assets/science.png',
        color: MyThemeData.YellowColor,
        rightSided: false));
  }
}
