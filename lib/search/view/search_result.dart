import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResult extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SearchResult());
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
    );
  }
}
