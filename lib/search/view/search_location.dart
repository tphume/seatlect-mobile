import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchLocation extends StatefulWidget {
  final CameraPosition initialPosition;

  const SearchLocation({@required this.initialPosition})
      : assert(initialPosition != null);

  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  Completer<GoogleMapController> _mapController = Completer();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select location',
          style: GoogleFonts.dmSans(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(initialCameraPosition: widget.initialPosition),
          Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
            child: TextFormField(
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
            ),
          )
        ],
      ),
    );
  }
}
