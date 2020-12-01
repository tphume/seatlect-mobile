import 'package:flutter/material.dart';

enum Page { home, search, favorites, order, settings }

class DrawerContent extends StatelessWidget {
  final Page current;

  DrawerContent(this.current);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      children: [
        _createHeader(),
        _createItem(
            theme: theme,
            page: Page.home,
            icon: Icons.home,
            text: 'Home',
            onTap: () => {}),
        _createItem(
            theme: theme,
            page: Page.search,
            icon: Icons.search,
            text: 'Search',
            onTap: () => {}),
        _createItem(
            theme: theme,
            page: Page.favorites,
            icon: Icons.favorite,
            text: 'Favorites',
            onTap: () => {}),
        _createItem(
            theme: theme,
            page: Page.order,
            icon: Icons.receipt,
            text: 'Order',
            onTap: () => {}),
        _createItem(
            theme: theme,
            page: Page.settings,
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => {})
      ],
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

  Widget _createItem(
      {ThemeData theme,
      Page page,
      IconData icon,
      String text,
      void Function() onTap}) {
    final color = (current == page) ? theme.primaryColor : Colors.black;

    return ListTile(
      onTap: onTap,
      title: Row(children: [
        Icon(icon, color: color),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 14),
          ),
        )
      ]),
    );
  }
}
