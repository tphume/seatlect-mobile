import 'package:flutter/material.dart';

enum Page { home, search, favorite, order }

class DrawerContent extends StatelessWidget {
  final Page current;

  DrawerContent({this.current});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
