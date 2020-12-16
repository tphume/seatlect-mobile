import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:seatlect_mobile/components/drawer_content.dart' as comp;
import 'package:seatlect_mobile/favorites/bloc/favorite_bloc.dart';

class FavoritesPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => FavoritesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorites',
            style: GoogleFonts.dmSans(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        drawer: Drawer(
          child: comp.DrawerContent(comp.Page.favorites),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
          child: Column(
            children: [
              Expanded(
                child: _buildFavorites(),
              )
            ],
          ),
        ));
  }

  Widget _buildFavorites() {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      return ListView(
        children: state.businesses.map<Widget>((b) => Text(b.name)).toList(),
      );
    });
  }
}
