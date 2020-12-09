import 'package:flutter/material.dart';

import 'package:seatlect_mobile/components/drawer_content.dart' as comp;

class FavoritesPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => FavoritesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: comp.DrawerContent(comp.Page.favorites),
      ),
      body: Text('Favorites'),
    );
  }
}
