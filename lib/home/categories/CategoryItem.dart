import 'package:flutter/material.dart';
import 'package:news_app_sat/ThemeProvider.dart';
import 'package:news_app_sat/model/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  Function onCategoryItemCallBack;

  CategoryItem(this.category, this.onCategoryItemCallBack);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryItemCallBack(category);
      },
      child: Container(
        decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: category.rightSided
                    ? Radius.circular(0)
                    : Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: category.rightSided
                    ? Radius.circular(12)
                    : Radius.circular(0))),
        child: Column(children: [
          Image.asset(
            category.imagePath,
            height: 120,
            fit: BoxFit.fill,
          ),
          Text(
            category.title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
