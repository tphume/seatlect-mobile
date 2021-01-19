import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seatlect_mobile/search/bloc/search_bloc.dart';

class SearchLocation extends StatefulWidget {
  final LatLng initialPosition;

  const SearchLocation({Key key, @required this.initialPosition})
      : assert(initialPosition != null),
        super(key: key);

  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  Completer<GoogleMapController> _mapController = Completer();
  Set<Marker> markers = Set();

  @override
  void initState() {
    markers.add(Marker(
        markerId: MarkerId('current'), position: widget.initialPosition));
    super.initState();
  }

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
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: widget.initialPosition, zoom: 15),
            zoomGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
            markers: markers,
            onTap: (latLng) {
              setState(() {
                markers.add(
                    Marker(markerId: MarkerId('current'), position: latLng));
              });
            },
          ),
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
          ),
          BlocListener<SearchBloc, SearchState>(
            child: Container(),
            listener: (context, state) {
              setState(() {
                markers.add(Marker(
                    markerId: MarkerId('current'),
                    position: LatLng(
                        state.location.latitude, state.location.longitude)));
              });
            },
          )
        ],
      ),
    );
  }
}
