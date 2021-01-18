import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:seatlect_mobile/components/drawer_content.dart' as comp;
import 'package:seatlect_mobile/search/bloc/search_bloc.dart';
import 'package:seatlect_mobile/search/view/search_result.dart';

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
                        child: SizedBox(
                          height: 45,
                          child: _buildLocation(context),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: SizedBox(
                          height: 45,
                          child: _buildType(context),
                        ),
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
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: _buildSortBy(context),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 15),
                  child: _buildSearch(context)),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 0),
                  child: _buildReset(context))
            ],
          ),
        ));
  }

  Widget _buildName(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return TextFormField(
        initialValue: state.name,
        onChanged: (value) {
          BlocProvider.of<SearchBloc>(context)
              .add(SearchUpdateName(name: value));
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
                borderRadius: BorderRadius.circular(10))),
      );
    });
  }

  Widget _buildLocation(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(37.42796133580664, -122.085749655962),
                        zoom: 14.4746,
                      ))));
        },
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
                  child: Text(state.address,
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
      return DropdownButtonHideUnderline(
        child: Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
                color: Color(0xFFE4E0EF),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton<String>(
              isExpanded: true,
              value: state.type,
              onChanged: (value) {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchUpdateType(type: value));
              },
              items: <String>['Restaurant', 'Bar', 'Theatre']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              icon: Icon(Icons.arrow_drop_down,
                  color: theme.primaryColor, size: 20),
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            )),
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
                    child: TextFormField(
                      initialValue: state.startPrice.toString(),
                      onChanged: (value) {
                        BlocProvider.of<SearchBloc>(context).add(
                            SearchUpdateStartPrice(
                                startPrice: int.parse(value)));
                      },
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
                    child: TextFormField(
                      initialValue: state.endPrice.toString(),
                      onChanged: (value) {
                        BlocProvider.of<SearchBloc>(context).add(
                            SearchUpdateEndPrice(endPrice: int.parse(value)));
                      },
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
            child: Text('Date',
                style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                  color: Color(0xFFE4E0EF),
                  borderRadius: BorderRadius.circular(10)),
              child: DateTimePicker(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.calendar_today,
                        color: theme.primaryColor,
                        size: 14,
                      )),
                  type: DateTimePickerType.dateTime,
                  initialValue: state.startDate.toString(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Start Date',
                  onChanged: (val) {
                    BlocProvider.of<SearchBloc>(context).add(
                        SearchUpdateStartDate(startDate: DateTime.parse(val)));
                  })),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
                color: Color(0xFFE4E0EF),
                borderRadius: BorderRadius.circular(10)),
            child: DateTimePicker(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.calendar_today,
                    color: theme.primaryColor,
                    size: 14,
                  )),
              type: DateTimePickerType.dateTime,
              initialValue: state.endDate.toString(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
              dateLabelText: 'End Date',
              onChanged: (val) {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchUpdateEndDate(endDate: DateTime.parse(val)));
              },
            ),
          )
        ],
      );
    });
  }

  Widget _buildSortBy(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text('Sort',
                style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
          DropdownButtonHideUnderline(
            child: Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                    color: Color(0xFFE4E0EF),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: state.sortBy,
                  onChanged: (value) {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchUpdateSortBy(sortBy: value));
                  },
                  items: <String>[
                    NAME_ASC,
                    NAME_DESC,
                    LOCATION_ASC,
                    LOCATION_DESC,
                    PRICE_ASC,
                    PRICE_DESC,
                    DATE_ASC,
                    DATE_DESC
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: Icon(Icons.arrow_drop_down,
                      color: theme.primaryColor, size: 20),
                  style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )),
          )
        ],
      );
    });
  }

  Widget _buildSearch(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(SearchResult.route());
      },
      child: Text('Search'),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: MaterialStateProperty.all<Color>(theme.primaryColor),
      ),
    );
  }

  Widget _buildReset(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
        onPressed: () {
          BlocProvider.of<SearchBloc>(context).add(SearchReset());
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/search', (route) => false);
        },
        child: Text(
          'Reset',
          style: TextStyle(color: theme.primaryColor),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ));
  }

  // Helper function to format date output
  String _formatDateTime(DateTime d) {
    return '${d.hour < 10 ? '0${d.hour}' : d.hour}:${d.minute < 10 ? '0${d
        .minute}' : d.minute} ${d.day} ${months[d.month - 1]} ${d.year}';
  }
}
