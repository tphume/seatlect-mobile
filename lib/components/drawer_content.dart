import 'package:flutter/material.dart';

enum Page { home, search, favorite, order }

class DrawerContent extends StatelessWidget {
  final Page current;

  DrawerContent(this.current);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [_createHeader()],
    );
  }

  Widget _createHeader() {
    return Container(
      margin: EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(border: Border(bottom: BorderSide())),
      child: Text('SEATLECT',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
    );
  }
}
