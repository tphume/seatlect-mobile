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
    return SizedBox(
        height: 100,
        child: DrawerHeader(
          margin: EdgeInsets.only(top: 16, bottom: 16),
          child: Container(
            decoration: BoxDecoration(),
            child: Text('SEATLECT',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
          ),
        ));
  }
}
