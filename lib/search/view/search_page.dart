import 'package:entity/entity.dart';
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
                child: _buildName(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: _buildLocation(context),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: _buildType(context),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildName(BuildContext context) {
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

  Widget _buildLocation(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return RaisedButton(
        onPressed: () {},
        child: Text(
            state.location == Location(latitude: 0, longitude: 0)
                ? 'Location'
                : 'Selected',
            style: TextStyle(fontSize: 16)),
      );
    });
  }

  Widget _buildType(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return DropdownButton<String>(
        isExpanded: true,
        value: state.type,
        onChanged: (value) {},
        items: <String>['Type', 'Restaurant', 'Bar', 'Theatre']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
