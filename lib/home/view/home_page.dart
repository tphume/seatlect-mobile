import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:seatlect_mobile/home/home.dart';
import 'package:seatlect_mobile/components/drawer_content.dart' as comp;
import 'package:seatlect_mobile/location/location.dart';
import 'package:seatlect_mobile/user/bloc/user_bloc.dart';
import 'package:seatlect_mobile/components/businessCard.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: _buildTitle(),
        ),
        drawer: Drawer(
          child: comp.DrawerContent(comp.Page.home),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  child: _buildBanner(), margin: EdgeInsets.only(bottom: 12)),
              Container(
                  child: _buildSearch(context),
                  margin: EdgeInsets.only(bottom: 30)),
              Container(
                height: 100,
                child: _buildTags(),
                margin: EdgeInsets.only(bottom: 30),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recommended',
                        style: GoogleFonts.yantramanav(
                            fontWeight: FontWeight.w700, fontSize: 18)),
                    GestureDetector(
                        onTap: () {
                          // TODO Pass search data to next page
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/search', (route) => false);
                        },
                        child: Text(
                          'View All',
                          style:
                              TextStyle(color: Color(0xFFF58F57), fontSize: 16),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: _buildRecommendation(),
              )
            ],
          ),
        ));
  }

  Widget _buildTitle() {
    return BlocBuilder<LocationCubit, LocationState>(builder: (context, state) {
      final theme = Theme.of(context);

      return Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          Icons.location_on_rounded,
          color: theme.primaryColor,
        ),
        Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              (state is LocationSelected) ? state.address : 'Location Unknown',
              style: GoogleFonts.dmSans(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ))
      ]);
    });
  }

  Widget _buildBanner() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Hi ${state.user.username},',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
          overflow: TextOverflow.fade,
        ),
        Text(
          'What would you like to book today?',
          style:
              TextStyle(color: Color(0xFFBDBDBD), fontWeight: FontWeight.w400),
        )
      ]);
    });
  }

  Widget _buildSearch(context) {
    final theme = Theme.of(context);

    return TextFormField(
      onFieldSubmitted: (value) {
        if (value.isEmpty) {
          return;
        }

        // TODO Pass search data to next page
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/search', (route) => false);
      },
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
  }

  Widget _buildTags() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      final tags = [...state.user.preference, 'MORE'];

      return ListView(
        scrollDirection: Axis.horizontal,
        children: tags
            .map<Widget>((v) => Container(
                  margin: EdgeInsets.only(right: (v != tags.last) ? 34 : 0),
                  child: Column(
                    // Placeholder svg icon for now
                    children: [
                      GestureDetector(
                          onTap: () {
                            // TODO Pass search data to next page
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/search', (route) => false);
                          },
                          child: SvgPicture.asset('assets/tags/placeholder.svg',
                              semanticsLabel: 'shortcut for searching $v tag',
                              width: 70,
                              height: 70)),
                      Text(
                        '${v[0]}${v.substring(1).toLowerCase()}',
                        style: GoogleFonts.yantramanav(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      )
                    ],
                  ),
                ))
            .toList(),
      );
    });
  }

  Widget _buildRecommendation() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomePopulated) {
        return ListView(
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
          children: state.businessList
              .map<Widget>((b) => BusinessCard(
                    business: b,
                  ))
              .toList(),
        );
      }

      return Text('Location service is disabled');
    });
  }
}
