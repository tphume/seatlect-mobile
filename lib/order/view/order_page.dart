import 'package:flutter/material.dart';

import 'package:seatlect_mobile/components/drawer_content.dart' as comp;

class OrderPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => OrderPage());
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
        child: comp.DrawerContent(comp.Page.order),
      ),
      body: Text('Order'),
    );
  }
}
