import 'package:asset_split/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationCommon extends StatelessWidget {
  const BottomNavigationCommon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: ((index) {
        switch (index) {
          case 0:
            context.goNamed(AppRoute.home.name);
            break;
          case 1:
            context.goNamed(AppRoute.assets.name);
            break;
          case 2:
            context.goNamed(AppRoute.home.name);
            break;
          case 3:
            context.goNamed(AppRoute.user.name);
            break;
        }
      }),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
          tooltip: 'this is a home page',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_home_outlined),
          label: 'asset',
          tooltip: "This is a Business Page",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_martial_arts_rounded),
          label: 'item',
          tooltip: "This is a Business Page",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'user',
          tooltip: "This is a Business Page",
          backgroundColor: Colors.green,
        ),
      ],
    );
  }
}
