import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:seatlect_mobile/components/drawer_content.dart' as comp;
import 'package:seatlect_mobile/search/bloc/search_bloc.dart';

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

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
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
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
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: _buildPriceRange(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: _buildDateRange(context),
              )
            ],
          ),
        ));
  }

  Widget _buildName(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return TextField(
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
                borderRadius: BorderRadius.circular(10))),
      );
    });
  }

  Widget _buildLocation(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black)),
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFE4E0EF)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: theme.primaryColor,
                  size: 14,
                ),
                Container(
                  margin: EdgeInsets.only(left: 3),
                  child: Text(
                      state.location ==
                              Location(latitude: 13.7563, longitude: 100.5018)
                          ? 'Location'
                          : 'Selected',
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            )),
      );
    });
  }

  Widget _buildType(BuildContext context) {
    final theme = Theme.of(context);

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
        icon: Icon(Icons.category, color: theme.primaryColor, size: 16),
        style: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: theme.primaryColor),
      );
    });
  }

  Widget _buildPriceRange(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Price range (baht)',
                  style: GoogleFonts.dmSans(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400))),
          Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          fillColor: Color(0xFFE4E0EF),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  flex: 10),
              Expanded(child: Text('to'), flex: 1),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          fillColor: Color(0xFFE4E0EF),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  flex: 10)
            ],
          ),
        ],
      );
    });
  }

  Widget _buildDateRange(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Date',
                        style: GoogleFonts.dmSans(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 21,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                  GoogleFonts.dmSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  theme.primaryColor),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 14,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 3),
                                child: Text('Pick',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          )),
                    )
                  ])),
          Text(
            '${_formatDateTime(state.startDate)} - ${_formatDateTime(state.endDate)}',
            style: TextStyle(color: Color(0xff4F4F4F)),
          ),
        ],
      );
    });
  }

  // Helper function to format date output
  String _formatDateTime(DateTime d) {
    return '${d.hour < 10 ? '0${d.hour}' : d.hour}:${d.minute < 10 ? '0${d.minute}' : d.minute} ${d.day} ${months[d.month - 1]} ${d.year}';
  }
}
