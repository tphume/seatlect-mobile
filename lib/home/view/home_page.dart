import 'package:flutter/material.dart';

import 'package:seatlect_mobile/components/drawer_content.dart' as comp;

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      drawer: Drawer(
        child: comp.DrawerContent(comp.Page.home),
      ),
      body: Text('Home'),
    );
  }
}
