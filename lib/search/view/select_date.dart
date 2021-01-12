import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:seatlect_mobile/search/bloc/search_bloc.dart';
import 'package:date_time_picker/date_time_picker.dart';

class SelectDate extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SelectDate());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          child:
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            return Column(
              children: [
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
                              SearchUpdateStartDate(
                                  startDate: DateTime.parse(val)));
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
                      BlocProvider.of<SearchBloc>(context).add(
                          SearchUpdateEndDate(endDate: DateTime.parse(val)));
                    },
                  ),
                )
              ],
            );
          })),
    );
  }
}
