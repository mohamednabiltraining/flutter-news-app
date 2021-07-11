import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  List<SideMenuItem> sideMenuList = [
    SideMenuItem('Categories', Icons.list),
    SideMenuItem('Settings', Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(vertical: 64),
          child: Center(
            child: Text(
              'News App!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (buildContex, index) {
              return SideMenuWidget(sideMenuList[index]);
            },
            itemCount: sideMenuList.length,
          ),
        )
      ],
    );
  }
}

class SideMenuItem {
  String title;
  IconData iconData;

  SideMenuItem(this.title, this.iconData);
}

class SideMenuWidget extends StatelessWidget {
  SideMenuItem sideMenuItem;

  SideMenuWidget(this.sideMenuItem);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.all(12), child: Icon(sideMenuItem.iconData)),
        Text(sideMenuItem.title)
      ],
    );
  }
}
