import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:seatlect_mobile/components/drawer_content.dart' as comp;
import 'package:seatlect_mobile/location/location.dart';

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
      body: Text('Home'),
    );
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
              (state is LocationSelected) ? state.location : 'Location Unknown',
              style: GoogleFonts.dmSans(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ))
      ]);
    });
  }
}
