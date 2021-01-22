import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatlect_mobile/components/bigBusinessCard.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool loading = true;
  List<Business> businesses = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search result',
            style: GoogleFonts.dmSans(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: loading
            ? Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Container(
                  height: 200,
                  child: CircularProgressIndicator(),
                ),
              )
            : _buildResult());
  }

  Widget _buildResult() {
    return ListView(
      children: businesses
          .map<Widget>((b) => BigBusinessCard(
                business: b,
              ))
          .toList(),
    );
  }
}
