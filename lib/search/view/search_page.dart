import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:seatlect_mobile/components/drawer_content.dart' as comp;
import 'package:seatlect_mobile/search/bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SearchPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search',
            style: GoogleFonts.dmSans(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        drawer: Drawer(
          child: comp.DrawerContent(comp.Page.search),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
          child: Column(
            children: [
              Container(
                child: _buildNameFilter(context),
              )
            ],
          ),
        ));
  }

  Widget _buildNameFilter(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return TextFormField(
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: theme.primaryIconTheme.color,
            ),
            hintText: 'Search by name',
            hintStyle: TextStyle(fontSize: 16, color: Color(0xFFCFBEED)),
            contentPadding: EdgeInsets.all(8),
            fillColor: Color(0xFFE4E0EF),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(20))),
      );
    });
  }
}
