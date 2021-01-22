import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:genproto/genproto.dart' as api;
import 'package:business_repository/business_repository.dart';
import 'package:seatlect_mobile/components/bigBusinessCard.dart';
import 'package:seatlect_mobile/search/bloc/search_bloc.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool loading = true;
  List<Business> businesses = [];

  @override
  void didChangeDependencies() {
    // ignore: close_sinks
    final searchBloc = context.read<SearchBloc>().state;
    final businessRepo = context.read<BusinessRepo>();

    api.Sort sort = api.Sort.NAME_ASC;

    // map sortBy to genproto
    switch (searchBloc.sortBy) {
      case NAME_ASC:
        sort = api.Sort.NAME_ASC;
        break;
      case NAME_DESC:
        sort = api.Sort.NAME_DESC;
        break;
      case LOCATION_ASC:
        sort = api.Sort.LOCATION_ASC;
        break;
      case LOCATION_DESC:
        sort = api.Sort.LOCATION_DESC;
        break;
      case PRICE_ASC:
        sort = api.Sort.PRICE_ASC;
        break;
      case PRICE_DESC:
        sort = api.Sort.PRICE_DESC;
        break;
      case DATE_ASC:
        sort = api.Sort.DATE_ASC;
        break;
      case DATE_DESC:
        sort = api.Sort.DATE_DESC;
        break;
    }

    () async {
      try {
        final b = await businessRepo.ListBusiness(10, sort,
            name: searchBloc.name,
            type: searchBloc.type,
            tags: searchBloc.tags,
            location: searchBloc.location,
            startPrice: searchBloc.startPrice,
            endPrice: searchBloc.endPrice,
            startDate: searchBloc.startDate,
            endDate: searchBloc.endDate);

        setState(() {
          loading = false;
          businesses = b;
        });
      } catch (e) {
        // Display error here or something
      }
    }();

    super.didChangeDependencies();
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
