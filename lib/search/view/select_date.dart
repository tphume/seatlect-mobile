import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectDate extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SelectDate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pick date',
          style: GoogleFonts.dmSans(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
        child: Column(),
      ),
    );
  }
}
